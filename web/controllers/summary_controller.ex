defmodule Minty.SummaryController do
  use Minty.Web, :controller

  alias Minty.Transaction

  def index(conn, _params) do
    lines = Repo.all(
      from txn in Transaction,
      group_by: txn.category,
      select: [txn.category, sum(txn.amount)]
    )

    sorted_lines = Enum.sort(lines,&(Enum.at(&1,1)>Enum.at(&2,1)))

    render(conn, "index.html", lines: sorted_lines)

  end

end
