# Author: Roshan Poudel
# Assignment: Homework 1
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Sept 21, 2024


#------------------------------------FIRST MODULE---------------------------------------------------
defmodule ListOperations do
  @moduledoc """
  This module contains functions to perform operations on lists.
  """

  @spec occurrences(any(), [any()]) :: integer()
  @doc """
  Given an item and a list, returns the number of times that item appears in the list.
  """
  def occurrences(_, []), do: 0
  def occurrences(item, [item | t]), do: 1 + occurrences(item, t)
  def occurrences(item, [_h | t]), do: occurrences(item, t)

  @spec append_if_not_present(any(), [any()]) :: [any()] | nil
  @doc """
  Given an item and a list, appends the item to the list if it is not already present.
  Returns the new list if the item is added, otherwise returns nil.
  """
  def append_if_not_present(item, list) do
    if occurrences(item, list) > 0 do
      nil
    else
      list ++ [item]
    end
  end
end

#------------------------------TEST CASES FOR FIRST MODULE-------------------------------------------

# Test cases for occurrences
IO.puts "Testing ListOperations.occurrences"
IO.puts "Expecting 3: #{ListOperations.occurrences(5, [5, 10, 5, 5, 7, 50, 55])}"
IO.puts "Expecting 0: #{ListOperations.occurrences(0, [6, 7, 8, 9, 1, 1, -2])}"

# Test cases for append_if_not_present
IO.puts "\nTesting ListOperations.append_if_not_present"
:io.format("Expecting ~p: ~p~n", [[1, 2, 3, 4], ListOperations.append_if_not_present(4, [1, 2, 3])])
:io.format("Expecting ~p: ~p~n", [nil, ListOperations.append_if_not_present(3, [1, 2, 3])])

expected_list = ["apple", "banana", "orange", "peach"]
result = ListOperations.append_if_not_present("peach", ["apple", "banana", "orange"])
IO.inspect(result, label: "Expecting #{inspect(expected_list)}")


#------------------------------------SECOND MODULE---------------------------------------------------
defmodule MyMath do
  # Avoid conflict with Kernel.raise/2 by excluding it
  import Kernel, except: [raise: 2]

  @moduledoc"""
  This module contains functions to perform simple mathematical computations
  """

  @spec raise() :: integer()
  @doc """
  Returns 0 when called with no arguments.
  """
  def raise(), do: 0

  @spec raise(number()) :: number()
  @doc """
  Returns the number itself when called with one argument.
  """
  def raise(n), do: n

  @spec raise(number(), number()) :: number()
  @doc """
    Raises the first number to the power of the second number.
    """
  def raise(_, 0), do: 1
  def raise(base, 1), do: base
  def raise(base, exponent) when exponent > 0 do
    base * raise(base, exponent - 1)
  end
  def raise(base, exponent) when exponent < 0 do
    1.0 / raise(base, -exponent)
  end


  @spec raise3(number(), integer(), number()) :: number()
  @doc """
  A helper function that performs the tail-recursive computation for raising a number to a power.
  """
  def raise3(_, 0, accum), do: accum
  def raise3(x, n, accum) when n > 0 do
    raise3(x, n - 1, x * accum)
  end

  @spec raiseTCO(number(), integer()) :: number()
  @doc """
  Tail-recursive version of raise that only works for positive exponents.
  Returns 0 for non-positive exponents.
  """
  def raiseTCO(x, n) when n > 0 do
    raise3(x, n, 1)
  end
  def raiseTCO(_, _), do: 0

  @spec generate_powers(number(), integer()) :: [number()]
  @doc """
  Generates a list of the powers of `x` from 0 to `max`.
  """
  def generate_powers(x, max) when max >= 0 do
    for n <- 0..max, do: raise(x, n)
  end
end

#------------------------------TEST CASES FOR SECOND MODULE-------------------------------------------

# Test cases for raise/0, raise/1, and raise/2
IO.puts "\nTesting MyMath.raise"
IO.puts "Expecting 0: #{MyMath.raise()}"
IO.puts "Expecting 5: #{MyMath.raise(5)}"
IO.puts "Expecting 25: #{MyMath.raise(5, 2)}"
IO.puts "Expecting 0.04: #{MyMath.raise(5, -2)}"
IO.puts "Expecting 1: #{MyMath.raise(5, 0)}"
IO.puts "Expecting 0: #{MyMath.raise(0, 5)}"
IO.puts "Expecting 1: #{MyMath.raise(0, 0)}"

# Test cases for raise3/3
IO.puts "\nTesting MyMath.raise3"
IO.puts "Expecting 8: #{MyMath.raise3(2, 3, 1)}"
IO.puts "Expecting 27: #{MyMath.raise3(3, 3, 1)}"
IO.puts "Expecting 10: #{MyMath.raise3(5, 0, 10)}"
IO.puts "Expecting 9: #{MyMath.raise3(3, 2, 1)}"

# Test cases for raiseTCO/2
IO.puts "\nTesting MyMath.raiseTCO"
IO.puts "Expecting 8: #{MyMath.raiseTCO(2, 3)}"
IO.puts "Expecting 25: #{MyMath.raiseTCO(5, 2)}"
IO.puts "Expecting 0: #{MyMath.raiseTCO(2, 0)}"
IO.puts "Expecting 0: #{MyMath.raiseTCO(2, -3)}"

# Test cases for generate_powers/2
IO.puts "\nTesting MyMath.generate_powers"
IO.puts "Expecting [1.0, 2.0, 4.0, 8.0, 16.0]: #{inspect(MyMath.generate_powers(2, 4))}"
IO.puts "Expecting [1.0, 3.0, 9.0, 27.0]: #{inspect(MyMath.generate_powers(3, 3))}"
IO.puts "Expecting [1.0]: #{inspect(MyMath.generate_powers(2, 0))}"
IO.puts "Expecting [1.0, 5.0]: #{inspect(MyMath.generate_powers(5, 1))}"


# Measure the time taken to run the generate_powers function
{time, _result} = :timer.tc(fn -> MyMath.generate_powers(2, 5700) end)

# Convert time to seconds for easier reading
time_in_ms = time / 1_000000

# Display only the time taken
IO.puts "\nTime taken: #{time_in_ms} s\n"
