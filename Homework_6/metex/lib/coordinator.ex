# Author: Roshan Poudel
# Assignment: Homework 6
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Nov 25, 2024

defmodule Metex.Coordinator do
  use GenServer

  # Client API

  def start_link(cities \\ []) do
    GenServer.start_link(__MODULE__, %{cities: cities, results: [], stats: %{}}, name: __MODULE__)
  end

  def get_temperature(city) do
    GenServer.call(__MODULE__, {:get_temperature, city})
  end

  def get_result(city) do
    GenServer.call(__MODULE__, {:get_result, city})
  end

  def get_stats do
    GenServer.cast(__MODULE__, :get_stats)
  end

  def reset_stats do
    GenServer.cast(__MODULE__, :reset_stats)
  end

  def stop do
    GenServer.stop(__MODULE__)
  end

  # Server Callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:get_temperature, city}, _from, state) do
    Task.start(fn -> Metex.Worker.get_temperature(city, self()) end)
    stats = Map.update(state.stats, city, 1, &(&1 + 1))
    {:reply, :ok, %{state | stats: stats}}
  end

  @impl true
  def handle_call({:get_result, city}, _from, state) do
    result = Enum.find(state.results, fn result -> String.starts_with?(result, city) end)
    {:reply, result || "#{city}: no data available", state}
  end

  @impl true
  def handle_info({:ok, result}, state) do
    results = [result | state.results]

    if Enum.count(results) == Enum.count(state.cities) do
      IO.puts(Enum.sort(results) |> Enum.join(", "))
    end

    {:noreply, %{state | results: results}}
  end

  @impl true
  def handle_cast(:get_stats, state) do
    IO.inspect(state.stats, label: "City Request Stats")
    {:noreply, state}
  end

  @impl true
  def handle_cast(:reset_stats, state) do
    {:noreply, %{state | stats: %{}}}
  end
end
