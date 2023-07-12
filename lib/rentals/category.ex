defmodule Rentals.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field(:name, :string)
    has_many(:items, Rentals.Item)
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name])
    |> validate_required(:name)
  end
end
