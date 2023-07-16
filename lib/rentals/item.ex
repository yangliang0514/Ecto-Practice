defmodule Rentals.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rentals.{Category, Repo, User}

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    belongs_to(:category, Category)
    many_to_many(:users, User, join_through: "rentals")
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
  end

  def create_item(category_id, params) do
    Repo.get(Category, category_id)
    |> Ecto.build_assoc(:items)
    |> changeset(params)
    |> Repo.insert()
  end
end
