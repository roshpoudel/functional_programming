# Author: Roshan Poudel
# Assignment: Homework 2 (Question 1 - 6)
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Oct 03, 2024

defmodule Ops do
    @moduledoc """
    This module contains functions as specified in homework 02.
    """

    @spec list_length(list()) :: integer()
    @doc """
    Calculates the length of the given list.
    """
    def list_length(list) do
        list_length(list, 0)
    end

    @spec list_length(list(), non_neg_integer()) :: non_neg_integer()
    @doc """
    Helper function to calculate the length of a list tail recursively. Not intended to be called directly.
    """
    defp list_length([], accum), do: accum
    defp list_length([_h | t], accum), do: list_length(t, accum + 1)


    @spec average_price(list(float())) :: float()
    @doc """
    Calculates recursively the average price of the given list of prices.
    """
    def average_price(prices) when length(prices) > 0 do
        {sum, count} = average_price_rec(prices, 0.0, 0)
        sum / count
    end

    @spec average_price_rec(list(float()), float(), non_neg_integer()) :: {float(), non_neg_integer()}
    @doc """
    Helper function to calculate the sum and count of prices in the list. Not intended to be called directly.
    """
    defp average_price_rec([], sum, count), do: {sum, count}
    defp average_price_rec([h | t], sum, count), do: average_price_rec(t, sum + h, count + 1)


    @spec average_price_enum(list(float())) :: float()
    @doc """
    Calculates the average price of the given list of prices using Enum.reduce.
    """
    def average_price_enum(prices) when length(prices) > 0 do
        Enum.sum(prices) / Enum.count(prices)
    end
    def average_price_enum([]), do: 0.0


    @spec eliminate_prices(list(float()), float()) :: list(float())
    @doc """
    Recursively filters the list to only include prices less than the threshold.
    """
    def eliminate_prices([], _threshold), do: []
    def eliminate_prices([h | t], threshold) do
        if h < threshold do
            [h | eliminate_prices(t, threshold)]  # Include the price if it's less than threshold
        else
            eliminate_prices(t, threshold)         # Skip it otherwise
        end
    end

    @spec eliminate_prices_enum(list(float()), integer()) :: list(float())
    @doc """
    Uses Enum module to filter out the prices less than the threshold
    """
    def eliminate_prices_enum(prices, threshold), do: Enum.filter(prices, &(&1 < threshold))


    @spec leap_year?(non_neg_integer()) :: boolean()
    @doc """
    Returns true if the given year is a leap year, false otherwise.
    """
    def leap_year?(year), do: (rem(year, 4) == 0 && rem(year, 100) != 0) || rem(year, 400) == 0

    @spec month_days(non_neg_integer()) :: list(integer())
    @doc """
    Returns the number of days in each month of the given year.
    """
    def month_days(year) do
        if leap_year?(year) do
            [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        else
            [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        end
    end

    @spec calculate_julian_date({non_neg_integer(), non_neg_integer(), non_neg_integer()}) :: non_neg_integer()
    @doc """
    Returns the Julian date given a date in a calendar.
    """
    def calculate_julian_date({mm, dd, yyyy}) do
        # Take the days from the months before mm
        julian_date = month_days(yyyy) |> Enum.take(mm - 1) |> Enum.sum()
        julian_date + dd
    end


    @spec remove_keys(%{}, list()) :: %{}
    @doc """
    Given a map and a list of keys, returns a new map with any key/value pairs whose keyword is in the collection removed
    """
    def remove_keys(map, keys) do
        # Iterate over the keys list, accumulating the result (acc).
        # Then remove each key from the map using Map.delete/2
        # The accumulator (acc) is updated after each iteration.
        Enum.reduce(keys, map, fn key, acc -> Map.delete(acc, key) end)
    end

    @spec random_ints(non_neg_integer()) :: list(integer())
    @doc """
    Generates a list of n random integers between 1 and n.
    """
    def random_ints(0), do: []
    def random_ints(n) do
        Enum.map(1..n, fn _ -> :rand.uniform(100) end)
    end
end


#---------------------------------TESTS---------------------------------

# Test case for list_length
IO.puts "\nTesting Ops.list_length"
IO.puts "Expecting 3, Actual: #{Ops.list_length([1, 2, 3])}"
IO.puts "Expecting 5, Actual: #{Ops.list_length([10, 20, 30, 40, 50])}"
IO.puts "Expecting 0, Actual: #{Ops.list_length([])}"

# Test case for average_price
IO.puts "\nTesting Ops.average_price"
IO.puts "Expecting 3.0, Actual: #{Ops.average_price([1.0, 2.0, 6.0])}"
IO.puts "Expecting 4.0, Actual: #{Ops.average_price([2.0, 6.0])}"
IO.puts "Expecting 0.0, Actual: #{Ops.average_price([0.0, 0.0])}"

# Test case for average_price_enum
IO.puts "\nTesting Ops.average_price_enum"
IO.puts "Expecting 3.0, Actual: #{Ops.average_price_enum([1.0, 2.0, 6.0])}"
IO.puts "Expecting 4.0, Actual: #{Ops.average_price_enum([2.0, 6.0])}"
IO.puts "Expecting 0.0, Actual: #{Ops.average_price_enum([])}"

# Test case for eliminate_prices
IO.puts "\nTesting Ops.eliminate_prices"
IO.puts "Expecting [2.0], Actual: #{inspect(Ops.eliminate_prices([5.0, 2.0, 10.0], 3.0))}"
IO.puts "Expecting [], Actual: #{inspect(Ops.eliminate_prices([5.0, 10.0], 3.0))}"

# Test case for eliminate_prices_enum
IO.puts "\nTesting Ops.eliminate_prices_enum"
IO.puts "Expecting [2.0], Actual: #{inspect(Ops.eliminate_prices_enum([5.0, 2.0, 10.0], 3.0))}"
IO.puts "Expecting [], Actual: #{inspect(Ops.eliminate_prices_enum([5.0, 10.0], 3.0))}"

# Test case for leap_year?
IO.puts "\nTesting Ops.leap_year?"
IO.puts "Expecting true, Actual: #{Ops.leap_year?(2024)}"
IO.puts "Expecting false, Actual: #{Ops.leap_year?(2023)}"
IO.puts "Expecting true, Actual: #{Ops.leap_year?(2000)}"
IO.puts "Expecting false, Actual: #{Ops.leap_year?(1900)}"

# Test case for month_days
IO.puts "\nTesting Ops.month_days"
IO.puts "Expecting [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], Actual: #{inspect(Ops.month_days(2024))}"
IO.puts "Expecting [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], Actual: #{inspect(Ops.month_days(2023))}"

# Test case for calculate_julian_date
IO.puts "\nTesting Ops.calculate_julian_date"
IO.puts "Expecting 60, Actual: #{Ops.calculate_julian_date({2, 29, 2024})}"
IO.puts "Expecting 59, Actual: #{Ops.calculate_julian_date({2, 28, 2023})}"
IO.puts "Expecting 1, Actual: #{Ops.calculate_julian_date({1, 1, 2012})}"
IO.puts "Expecting 32, Actual: #{Ops.calculate_julian_date({2, 1, 2020})}"

# Test case for remove_keys
IO.puts "\nTesting Ops.remove_keys"
IO.puts "Expecting %{a: 1}, Actual: #{inspect(Ops.remove_keys(%{a: 1, b: 2, c: 3}, [:b, :c]))}"
IO.puts "Expecting %{}, Actual: #{inspect(Ops.remove_keys(%{a: 1}, [:a]))}"
IO.puts "Expecting %{saul: 49}, Actual: #{inspect(Ops.remove_keys(%{:walter => 52, :jesse => 23, :saul => 49}, [:jesse, :walter]))}"

# Test case for random_ints
IO.puts "\nTesting Ops.random_ints"

random_list_1 = Enum.take(Ops.random_ints(100), 10)
IO.puts "Expecting 10 random number between 1 and 100, Actual: #{inspect(random_list_1)}"

random_list_2 = Enum.take(Ops.random_ints(0), 10)
IO.puts "Expecting an empty list, Actual: #{inspect(random_list_2, charlists: :as_lists)}"

random_list_3 = Enum.take(Ops.random_ints(1), 10)
IO.puts "Expecting a random number between 1 and 100, Actual: #{inspect(random_list_3, charlists: :as_lists)}"

random_list_4 = Enum.take(Ops.random_ints(10), 5)
IO.puts "Expecting 5 random numbers between 1 and 100, Actual: #{inspect(random_list_4)}"

random_list_5 = Enum.take(Ops.random_ints(100), 100)
IO.puts "Expecting 100 random numbers between 1 and 100, Actual: #{length(random_list_5) == 100}"
