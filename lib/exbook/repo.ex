defmodule ExBook.Repo do
  use Ecto.Repo,
    otp_app: :exbook,
    adapter: Ecto.Adapters.SQLite3
end
