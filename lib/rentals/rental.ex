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
    |> validate_required([:rental_date, :return_date, :total_amount])
    |> validate_return_date()
  end

  def validate_return_date(changeset) do
    compare_dates =
      Date.compare(get_field(changeset, :rental_date), get_field(changeset, :return_date))

    if compare_dates == :lt do
      changeset
    else
      add_error(changeset, :return_date, "can't be before rental date")
    end
  end

  def create_rental(user_id, item_id, params) do
    user = Repo.get(User, user_id)
    item = Repo.get(Item, item_id)

    rental_struct = Ecto.build_assoc(user, :rentals)

    Ecto.build_assoc(item, :rentals, rental_struct)
    |> changeset(params)
    |> IO.inspect()
    |> Repo.insert()
  end
end
