# Author: Roshan Poudel
# Assignment: Homework 6
# Course: CSCI 326 (Functional Programming) - Fall 2024
# Date: Nov 25, 2024

defmodule Metex.Worker do
  @apikey "8f8053ec352c23dbb00fb503c7a1bd5d"

  def get_temperature(location, coordinator_pid) do
    result = temperature_of(location)
    send(coordinator_pid, {:ok, result})
  end

  defp temperature_of(location) do
    case url_for(location) |> HTTPoison.get() |> parse_response() do
      {:ok, temp} -> "#{location}: #{temp}°C"
      :error -> "#{location} not found"
    end
  end

  defp url_for(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/3.0/weather?q=#{location}&appid=#{@apikey}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    compute_temperature({:ok, JSON.decode!(body)})
  end

  defp parse_response(_) do
    :error
  end

  defp compute_temperature({:ok, json}) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :error
    end
  end
end
