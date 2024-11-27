defmodule DiceRollerTest do
  use ExUnit.Case

  # Test for valid input
  test "valid roll with correct input" do
    pid = spawn(DiceRoller, :handle_message, [])

    # Send valid message
    send(pid, {:roll, self(), 4, [20, 6, 6, 6]})

    # Receive response and check it
    assert_receive {:response, rolls}, 500
    assert length(rolls) == 4
    assert Enum.all?(rolls, fn roll -> roll in 1..6 end)
  end

  # Test for invalid 'num' (non-positive integer)
  test "invalid roll with non-positive 'num'" do
    pid = spawn(DiceRoller, :handle_message, [])

    # Send invalid message (negative num)
    send(pid, {:roll, self(), -1, [20, 6, 6, 6]})

    # Receive error response
    assert_receive {:error, reason}, 500
    assert reason == "Malformed message"
  end

  # Test for invalid 'vals' (contains non-positive integer)
  test "invalid roll with non-positive value in 'vals'" do
    pid = spawn(DiceRoller, :handle_message, [])

    # Send invalid message (contains non-positive value in vals)
    send(pid, {:roll, self(), 3, [20, -6, 6]})

    # Receive error response
    assert_receive {:error, reason}, 500
    assert reason == "All values must be positive integers"
  end

  # Test for empty vals list
  test "invalid roll with empty 'vals' list" do
    pid = spawn(DiceRoller, :handle_message, [])

    # Send invalid message (empty vals list)
    send(pid, {:roll, self(), 0, []})

    # Receive error response
    assert_receive {:error, reason}, 500
    assert reason == "Malformed message"
  end

  # Test for reset of random number generator
  test "reset random generator" do
    DiceRoller.reset_random_generator()

    # Validate that reset occurs without errors (just ensure no crashes)
    assert :ok
  end
end
