# Author: Roshan Poudel
# Assignment: Homework 6
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Nov 25, 2024

defmodule DiceRoller do
  # Main function to handle the roll message
  def handle_message({:roll, pid, num, vals}) when is_integer(num) and num > 0 do
    if Enum.all?(vals, fn v -> is_integer(v) and v > 0 end) do
      rolls = Enum.map(vals, fn val -> :rand.uniform(val) end)
      send(pid, {:response, rolls})
    else
      send(pid, {:error, "All values must be positive integers"})
    end
  end

  # Error handling for malformed messages
  def handle_message(_), do: {:error, "Malformed message"}

  # Function to reset the random number generator
  def reset_random_generator do
    :rand.seed(:exsplus, {1234, 5678, 91011})
  end
end
