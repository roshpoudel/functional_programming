defmodule OneTimePad do
  @moduledoc """
  Implements a one-time pad cipher for encrypting and decrypting messages.
  """

  # Generates a one-time pad (key) of random integers between 1 and 26.
  def generate_pad(size) do
    Enum.map(1..size, fn _ -> :rand.uniform(26) end)
  end

  # Encrypts a message using the one-time pad key.
  def cipher(pad, message) do
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

  # Decrypts an encrypted message using the one-time pad key.
  def decipher(pad, encrypted_message) do
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

  # Helper function to check if a character is alphabetic.
  defp is_alpha(char), do: char =~ ~r/^[A-Za-z]$/

  # Helper function to convert a character to its corresponding number (1-26).
  defp char_to_number(char) do
    alphabet = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    char_down = String.downcase(char)
    Enum.find_index(alphabet, fn c -> c == char_down end) + 1
  end

  # Helper function to convert a number (1-26) back to a character.
  defp number_to_char(num, is_upper) do
    alphabet = String.codepoints("abcdefghijklmnopqrstuvwxyz")
    char = Enum.at(alphabet, num - 1)
    if is_upper, do: String.upcase(char), else: char
  end
end

defmodule Control do
  @moduledoc """
  Manages the one-time pad and spawns Bob and Alice.
  """

  def start do
    # Generate one-time pad and store it in an Agent
    {:ok, agent} = Agent.start(fn -> OneTimePad.generate_pad(100) end)

    # Spawn Bob and Alice processes
    bob = spawn(Bob, :start, [agent])
    alice = spawn(Alice, :start, [agent])

    # Test communication
    send(bob, {:send_message, alice, "Hello Alice!"})
    send(alice, {:send_message, bob, "Hi Bob! How are you?"})
    send(bob, {:send_message, alice, "This is encrypted, don't tell anyone!"})
    send(alice, {:send_message, bob, ""})
    send(bob, {:send_message, alice, "Do special characters #@$ encrypt?"})

    # Stop the agent after the test run
    :timer.sleep(2000)
    Agent.stop(agent)
  end
end

defmodule Bob do
  @moduledoc """
  Represents Bob, who can send and receive encrypted messages.
  """

  def start(agent) do
    receive do
      {:send_message, recipient, message} ->
        pad = Agent.get(agent, & &1)
        encrypted_message = OneTimePad.cipher(pad, message)
        IO.puts("Bob (sending): #{message} -> #{encrypted_message}")
        send(recipient, {:receive_message, self(), encrypted_message})

      {:receive_message, sender, encrypted_message} ->
        pad = Agent.get(agent, & &1)
        decrypted_message = OneTimePad.decipher(pad, encrypted_message)
        IO.puts("Bob (received): #{encrypted_message} -> #{decrypted_message}")
    end

    start(agent)
  end
end

defmodule Alice do
  @moduledoc """
  Represents Alice, who can send and receive encrypted messages.
  """

  def start(agent) do
    receive do
      {:send_message, recipient, message} ->
        pad = Agent.get(agent, & &1)
        encrypted_message = OneTimePad.cipher(pad, message)
        IO.puts("Alice (sending): #{message} -> #{encrypted_message}")
        send(recipient, {:receive_message, self(), encrypted_message})

      {:receive_message, sender, encrypted_message} ->
        pad = Agent.get(agent, & &1)
        decrypted_message = OneTimePad.decipher(pad, encrypted_message)
        IO.puts("Alice (received): #{encrypted_message} -> #{decrypted_message}")
    end

    start(agent)
  end
end

# Run the Control process to test the program
Control.start()
