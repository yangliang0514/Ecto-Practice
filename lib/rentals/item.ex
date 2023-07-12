defmodule Rentals.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    belongs_to(:category, Rentals.Category)
    has_many(:rentals, Rentals.Rental)
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end
end
