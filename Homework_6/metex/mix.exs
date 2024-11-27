defmodule Metex.Mixfile do
  use Mix.Project

  def project do
    [app: :metex, version: "0.0.1", elixir: "~> 1.17", deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison, :json]]
  end

  def deps do
    [
      {:httpoison, "~> 1.8"},
      {:json, "~> 1.4"}
    ]
  end
end
