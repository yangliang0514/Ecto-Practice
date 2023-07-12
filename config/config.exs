import Config

config :rentals, Rentals.Repo,
  database: "rentals_repo",
  username: "postgres",
  password: "",
  hostname: "localhost",
  port: 5433

config :rentals, ecto_repos: [Rentals.Repo]
