# Author: Roshan Poudel
# Assignment: Homework 6
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Nov 25, 2024

defmodule Metex do
  def start(cities) do
    {:ok, _pid} = Metex.Coordinator.start_link(cities)
  end

  def get_temperature(city) do
    Metex.Coordinator.get_temperature(city)
  end

  def get_result(city) do
    Metex.Coordinator.get_result(city)
  end

  def get_stats do
    Metex.Coordinator.get_stats()
  end

  def reset_stats do
    Metex.Coordinator.reset_stats()
  end

  def stop do
    Metex.Coordinator.stop()
  end
end
