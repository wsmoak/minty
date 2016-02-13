defmodule Minty.TransactionTest do
  use Minty.ModelCase

  alias Minty.Transaction

  @valid_attrs %{account_name: "some content", category: "some content", date: "2010-04-17", description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Transaction.changeset(%Transaction{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Transaction.changeset(%Transaction{}, @invalid_attrs)
    refute changeset.valid?
  end
end
