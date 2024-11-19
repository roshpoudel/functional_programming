defmodule SimpleQueue do
  use GenServer

  ### Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def enqueue(value), do: GenServer.cast(__MODULE__, {:enqueue, value})
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
  def empty, do: GenServer.call(__MODULE__, :empty)

  ### GenServer API

  @doc """
  GenServer.init/1 callback initializes queue to whatever state is (empty list by default)
  NOTE: this or start_link probably should test that state is a list, otherwise further queue operations will fail
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  """
  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  @doc """
  GenServer.handle_cast/2 callback
  """
  def handle_cast({:enqueue, value}, state) do
    {:noreply, state ++ [value]}
  end

  @doc """
  handle_call for :empty action, returns :true if queue is empty, :false otherwise
  """
  def handle_call(:empty, _from, []), do: {:reply, true, []}
  def handle_call(:empty, _from, [h | t]), do: {:reply, false, [h | t]}
end
