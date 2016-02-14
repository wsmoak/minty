# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Minty.Repo.insert!(%Minty.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Minty.Transaction
alias Minty.Repo

defmodule Minty.Seeds do

  def fix_it(%{transaction_type: "debit"} = row) do
    Map.update!(row,:amount,&("-"<>&1))
  end

  def fix_it(%{transaction_type: "credit"} = row) do
    row
  end

  def store_it(row) do
    IO.inspect row
    row = fix_it(row)
    changeset = Transaction.changeset(%Transaction{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("/Users/wsmoak/Downloads/transactions.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:date, :description, :original_description, :amount, :transaction_type, :category, :account_name, :labels, :notes])
  |> Enum.each(&Minty.Seeds.store_it/1)
