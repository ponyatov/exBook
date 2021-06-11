defmodule ExBook.Repo.Migrations.User do
  use Ecto.Migration

  def change do
    create table :user do
      add :login, :string
      add :passwd, :string
      add :first_name, :string
      add :sec_name, :string
      add :last_name, :string
      add :email, :string
      add :phone, :string
      add :telegram, :string
      add :skype, :string
    end
  end
end
