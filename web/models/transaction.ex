defmodule Minty.Transaction do
  use Minty.Web, :model

  schema "transactions" do
    field :date, :string
    field :description, :string
    field :original_description, :string
    field :amount, :string
    field :transaction_type, :string
    field :category, :string
    field :account_name, :string
    field :labels, :string
    field :notes, :string

    timestamps
  end

  @required_fields ~w(account_name category date description amount)
  @optional_fields ~w(original_description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
