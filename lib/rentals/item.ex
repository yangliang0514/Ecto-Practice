defmodule Rentals.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rentals.{Category, Repo}

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

  def insert_with_assoc(category_id, params) do
    Repo.get(Category, category_id)
    |> Ecto.build_assoc(:items)
    |> changeset(params)
    |> Repo.insert()
  end
end
