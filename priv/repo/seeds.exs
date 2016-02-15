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

  def fix_amount(%{transaction_type: "debit"} = row) do
    Map.update!(row,:amount,&("-"<>&1))
  end

  def fix_amount(%{transaction_type: "credit"} = row) do
    row
  end

  def fix_date(%{date: <<m0,"/",d1,d0,"/",y3,y2,y1,y0>>} = row) do
    date = <<y3,y2,y1,y0,"-","0",m0,"-",d1,d0>>
    Map.update!(row,:date,fn _ -> date end)
  end

  def fix_date(%{date: <<m1,m0,"/",d1,d0,"/",y3,y2,y1,y0>>} = row) do
    date = <<y3,y2,y1,y0,"-",m1,m0,"-",d1,d0>>
    Map.update!(row,:date,fn _ -> date end)
  end

  def store_it(row) do
    IO.inspect row
    row = fix_amount(row)
    row = fix_date(row)
    changeset = Transaction.changeset(%Transaction{}, row)
    Repo.insert!(changeset)
  end

end

File.stream!("/Users/wsmoak/Downloads/transactions.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:date, :description, :original_description, :amount, :transaction_type, :category, :account_name, :labels, :notes])
  |> Enum.each(&Minty.Seeds.store_it/1)
