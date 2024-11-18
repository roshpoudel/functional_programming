defmodule E11M.Concurrent do
  @doc """
  Start a process that sleeps awhile then tells us it's awake.
  """
  def proc(millis) do
    spawn(fn ->
      Process.sleep(millis)
      IO.puts("I'm up! I'm up!")
    end)
  end

  @doc """
  Waits for and prints a msg, or times out after 5 sec.
  """
  def reply do
    receive do
      message -> IO.inspect(message)
    after
      5000 -> IO.puts("Message not received")
    end
  end

  @doc """
  Continuously waits for messages, maintains a sum, and handles specific commands.
  """
  def endless_reply(x \\ 0) do
    receive do
      {:value, num} ->
        # Add the number to the sum and recursively call with updated sum
        IO.puts("Accumulating: #{x} + #{num} = #{x + num}")
        endless_reply(x + num)

      :report ->
        # Report the sum and reset it to 0
        IO.puts("Current sum: #{x}")
        endless_reply(0)

      message ->
        # Default behavior
        IO.inspect(message)
        endless_reply(x)
    end
  end
end

# Tests
E11M.Concurrent.proc(2000)

pid = spawn(&E11M.Concurrent.reply/0)
send(pid, "working")

pid2 = spawn(&E11M.Concurrent.endless_reply/0)

# Sending test messages
# Accumulate 5
send(pid2, {:value, 5})
Process.sleep(1000)
# Accumulate 10, making the sum 15
send(pid2, {:value, 10})
Process.sleep(1000)
# Report the sum (15) and reset
send(pid2, :report)
Process.sleep(1000)
# Accumulate 20
send(pid2, {:value, 20})
Process.sleep(1000)
# Default message handling
send(pid2, "random message")
Process.sleep(5000)
IO.puts("Done!")
