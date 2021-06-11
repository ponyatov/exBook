use Mix.Config

config :exbook,
  ecto_repos: [ExBook.Repo]

config :logger, :console,
  format: "$date $time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env()}.exs"
