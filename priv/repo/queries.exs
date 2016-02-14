defmodule Minty.Queries do
  import Ecto.Query

  alias Minty.Repo
  alias Minty.Transaction

  def bignum do
    Repo.all(
      from txn in Transaction,
      where: txn.amount > 1000
    )
  end

  def summary do
    Repo.all(
      from txn in Transaction,
      group_by: txn.category,
      select: [txn.category, sum(txn.amount)]
    )
  end

  def print_summary do
    Minty.Queries.summary
    |> Enum.sort(&(Enum.at(&1,1)>Enum.at(&2,1)))
    |> Enum.each(&(IO.puts("#{Enum.at(&1,0)} #{Float.to_string(Enum.at(&1,1),[decimals: 2])}")))
  end
end
