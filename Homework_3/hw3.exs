# Author: Roshan Poudel
# Assignment: Homework 3
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Oct 9, 2024


defmodule OneTimePad do

  @moduledoc """
  Implements a one-time pad cipher for encrypting and decrypting messages.

  This module provides functions to generate a one-time pad key, encrypt messages using the key,
  and decrypt encrypted messages. Only alphabetic characters (both uppercase and lowercase) are
  encrypted; special characters and spaces remain unchanged. The case of the letters is preserved
  during encryption and decryption.
  """

  defstruct key: []

  @doc """
  Generates a one-time pad (key) of random integers between 1 and 26.
  """
  @spec onepad(integer()) :: %OneTimePad{}
  def onepad(size) do
    key = Enum.map(1..size, fn _ -> :rand.uniform(26) end)
    %OneTimePad{key: key}
  end

  @doc """
  Encrypts a message using the one-time pad key.
  """
  @spec cipher(%OneTimePad{}, String.t()) :: String.t()
  def cipher(%OneTimePad{key: pad}, message) do
    message_chars = String.codepoints(message)

    encrypted_chars =
      Enum.zip(message_chars, pad)
      |> Enum.map(fn {char, pad_value} ->
        if is_alpha(char) do
          is_upper = char == String.upcase(char)
          char_num = char_to_number(char)
          new_char_num = rem(char_num + pad_value - 1, 26) + 1
          number_to_char(new_char_num, is_upper)
        else
          char
        end
      end)

    Enum.join(encrypted_chars)
  end

  @doc """
  Decrypts an encrypted message using the one-time pad key.
  """
  @spec decipher(%OneTimePad{}, String.t()) :: String.t()
  def decipher(%OneTimePad{key: pad}, encrypted_message) do
    encrypted_chars = String.codepoints(encrypted_message)

    original_chars =
      Enum.zip(encrypted_chars, pad)
      |> Enum.map(fn {char, pad_value} ->
        if is_alpha(char) do
          is_upper = char == String.upcase(char)
          char_num = char_to_number(char)
          new_char_num = rem(char_num - pad_value - 1 + 26, 26) + 1
          number_to_char(new_char_num, is_upper)
        else
          char
        end
      end)

    Enum.join(original_chars)
  end

  #Helper function to check if a character is alphabetic.
  defp is_alpha(char) do
    char =~ ~r/^[A-Za-z]$/
  end

  #Helper function to convert a character to its corresponding number (1-26).
  defp char_to_number(char) do
    # Define the alphabet as a list of lowercase letters
    alphabet = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    char_down = String.downcase(char)

    # Find the index of the character in the alphabet
    case Enum.find_index(alphabet, fn c -> c == char_down end) do
      nil -> 0  # Should not happen for alphabetic characters
      index -> index + 1  # Add 1 because lists are zero-indexed
    end
  end


  #Helper function to convert a number (1-26) back to a character.
  defp number_to_char(num, is_upper) do
    # Define the alphabet as a list of lowercase letters
    alphabet = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    # Get the character at the specified position
    char = Enum.at(alphabet, num - 1)
    if is_upper, do: String.upcase(char), else: char
  end
end

#-------------------------------------------TEST-------------------------------------------

defmodule TestOneTimePad do
  def run do
    # Messages to be encrypted
    message1 = "Give me some cool stuff to encrypt. I am tired of encrypting hello world."
    message2 = "What? This WORKS!!!"
    message3 = ""
    message4 = "A cesium atom vibrates 9,192,631,770 times per second. That's the official definition of a second. Well, atomic clock."


    IO.puts("\nTesting One-Time Pad Encryption and Decryption...\n")

    # Test with message1
    pad1 = OneTimePad.onepad(String.length(message1))
    encrypted_message1 = OneTimePad.cipher(pad1, message1)
    decrypted_message1 = OneTimePad.decipher(pad1, encrypted_message1)
    IO.puts("Original Message 1: #{message1}")
    IO.puts("Encrypted Message 1: #{encrypted_message1}")
    IO.puts("Decrypted Message 1: #{decrypted_message1}")
    IO.puts("Decryption Successful: #{message1 == decrypted_message1}")
    IO.puts("")

    # Test with message2
    pad2 = OneTimePad.onepad(String.length(message2))
    encrypted_message2 = OneTimePad.cipher(pad2, message2)
    decrypted_message2 = OneTimePad.decipher(pad2, encrypted_message2)
    IO.puts("Original Message 2: #{message2}")
    IO.puts("Encrypted Message 2: #{encrypted_message2}")
    IO.puts("Decrypted Message 2: #{decrypted_message2}")
    IO.puts("Decryption Successful: #{message2 == decrypted_message2}")
    IO.puts("")

    # Test with message3 (empty message)
    pad3 = OneTimePad.onepad(String.length(message3))
    encrypted_message3 = OneTimePad.cipher(pad3, message3)
    decrypted_message3 = OneTimePad.decipher(pad3, encrypted_message3)
    IO.puts("Original Message 3: #{inspect(message3)}")
    IO.puts("Encrypted Message 3: #{inspect(encrypted_message3)}")
    IO.puts("Decrypted Message 3: #{inspect(decrypted_message3)}")
    IO.puts("Decryption Successful: #{message3 == decrypted_message3}")
    IO.puts("")

    # Test with message4
    pad4 = OneTimePad.onepad(String.length(message4))
    encrypted_message4 = OneTimePad.cipher(pad4, message4)
    decrypted_message4 = OneTimePad.decipher(pad4, encrypted_message4)
    IO.puts("Original Message 4: #{inspect(message4)}")
    IO.puts("Encrypted Message 4: #{inspect(encrypted_message4)}")
    IO.puts("Decrypted Message 4: #{inspect(decrypted_message4)}")
    IO.puts("Decryption Successful: #{message4 == decrypted_message4}")
    IO.puts("")
  end
end

TestOneTimePad.run()
