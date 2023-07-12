defmodule Rentals.MixProject do
  use Mix.Project

  def project do
    [
      app: :rentals,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Rentals.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:postgrex, "~> 0.17.1"}, {:ecto_sql, "~> 3.10"}]
  end
end
