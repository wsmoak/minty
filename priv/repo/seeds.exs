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

defmodule Minty.Seeds do

  def store_it(row) do
    IO.inspect row
  end

end

File.stream!("/Users/wsmoak/Downloads/transactions.csv")
  |> CSV.decode(headers: true)
  |> Enum.each(&Minty.Seeds.store_it/1)
