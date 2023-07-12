defmodule Rentals.Rental do
  use Ecto.Schema

  schema "rentals" do
    field(:rental_date, :date)
    field(:return_date, :date)
    field(:total_amount, :decimal)
    field(:user_id, :integer)
    belongs_to(:items, Rentals.Item)
    timestamps()
  end
end
