defmodule Minty.SummaryController do
  use Minty.Web, :controller

  alias Minty.Transaction

  def index(conn, _params) do
    lines = Repo.all(
      from txn in Transaction,
      group_by: txn.category,
      select: [txn.category, sum(txn.amount)]
    )

    render(conn, "index.html", lines: lines)

  end

end
