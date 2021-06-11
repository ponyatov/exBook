defmodule ExBook.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      ExBook.Repo
    ]

    opts = [strategy: :one_for_one, name: ExBook.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
