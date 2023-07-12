defmodule Rentals.Rental do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rentals.{Repo, User, Item}

  schema "rentals" do
    field(:rental_date, :date)
    field(:return_date, :date)
    field(:total_amount, :decimal)
    belongs_to(:item, Rentals.Item)
    belongs_to(:user, Rentals.User)
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:rental_date, :return_date, :total_amount, :user_id])
    |> validate_required([:rental_date, :return_date, :total_amount, :user_id])
  end

  def create_rental(username, item_id, params) do
    user = Repo.get_by(User, name: username)
    item = Repo.get(Item, item_id)

    rental_struct = Ecto.build_assoc(user, :rentals)

    Ecto.build_assoc(item, :rentals, rental_struct)
    |> changeset(params)
    |> Repo.insert()
  end
end
