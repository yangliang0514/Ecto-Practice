defmodule Rentals.Rental do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rentals" do
    field(:rental_date, :date)
    field(:return_date, :date)
    field(:total_amount, :decimal)
    field(:user_id, :integer)
    belongs_to(:item, Rentals.Item)
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:rental_date, :return_date, :total_amount, :user_id])
    |> validate_required([:rental_date, :return_date, :total_amount, :user_id])
  end
end
