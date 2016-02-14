defmodule Minty.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :date, :string
      add :description, :string
      add :original_description, :string
      add :amount, :string
      add :transaction_type, :string
      add :category, :string
      add :account_name, :string
      add :labels, :string
      add :notes, :string

      timestamps
    end

  end
end
