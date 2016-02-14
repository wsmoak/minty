defmodule Minty.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :account_name, :string
      add :category, :string
      add :date, :string
      add :description, :string

      timestamps
    end

  end
end
