defmodule Rentals.User do
  use Ecto.Schema
  alias Rentals.Rental

  schema "users" do
    field(:name, :string)
    many_to_many(:rentals, Rental, join_through: "rentals")
  end
end
