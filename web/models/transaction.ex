defmodule Minty.Transaction do
  use Minty.Web, :model

  schema "transactions" do
    field :account_name, :string
    field :category, :string
    field :date, Ecto.Date
    field :description, :string

    timestamps
  end

  @required_fields ~w(account_name category date description)
  @optional_fields ~w()

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
