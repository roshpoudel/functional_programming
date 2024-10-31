defmodule Processes do
  @moduledoc """
   Gather statistics about the maximum number of processes in an iex session,
   and the average amount of time process creation takes
  """

  @doc "max(N) - Time the task of creating N processes, then destroy them"
  @spec max(integer)::atom
  def max(nprocs) when nprocs > 0 do
    limit = :erlang.system_info(:process_limit)
    :io.format("Maximum allowed processes:~p~n",[limit])
    :erlang.statistics(:runtime)
    :erlang.statistics(:wall_clock)
    procs = for _x <- 1..nprocs, do: spawn(fn -> wait() end)
    {_, time1} = :erlang.statistics(:runtime)
    {_, time2} = :erlang.statistics(:wall_clock)
    Enum.each(procs, fn(pid) -> send(pid, :die) end)
    ms1 = time1 * 1000 / nprocs
    ms2 = time2 * 1000 / nprocs
    :io.format("Process spawn time=~p (~p wall-clock) microseconds~n",
	      [ms1, ms2])
  end

  defp wait() do
    receive do
	:die -> :void
	_    -> IO.puts "unknown message, ignoring"
    end
  end

end
