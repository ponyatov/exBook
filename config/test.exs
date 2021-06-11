use Mix.Config

config :exbook, ExBook.Repo,
  database: "tmp/test.db",
  pool: Ecto.Adapters.SQL.Sandbox
