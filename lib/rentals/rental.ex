defmodule Rentals.Rental do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rentals.{Repo, User, Item}

  schema "rentals" do
    field(:rental_date, :date)
    field(:return_date, :date)
    field(:total_amount, :decimal)
    belongs_to(:item, Item)
    belongs_to(:user, User)
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:rental_date, :return_date, :total_amount, :user_id, :item_id])
    |> validate_required([:user_id, :item_id, :rental_date, :total_amount])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:item_id)
    |> validate_return_date()
  end

  def validate_return_date(changeset) do
    return_date = get_field(changeset, :return_date)

    if return_date do
      compare_dates =
        Date.compare(get_field(changeset, :rental_date), return_date)

      case compare_dates do
        :gt -> add_error(changeset, :return_date, "can't be before rental date")
        _ -> changeset
      end
    else
      changeset
    end
  end

  def return_rental(rental) do
    rental
    |> changeset(%{return_date: Date.utc_today()})
    |> Repo.update()
  end
end
