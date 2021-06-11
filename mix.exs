defmodule ExBook.MixProject do
  use Mix.Project

  def project do
    [
      app: :exbook,
      version: "0.0.1",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {ExBook.Application, []},
      extra_applications: [
        :logger
      ]
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      # web interface
      {:plug_cowboy, "~> 2.0"},
      # .json/REST
      {:jason, "~> 1.0"},
      {:httpoison, "~> 1.8"},
      # ecto
      {:postgrex, ">= 0.0.0"},
      {:ecto_sqlite3, "~> 0.5.5"},
      # dev tools
      {:exsync, "~> 0.2", only: [:dev]}
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end
end
