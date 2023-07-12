defmodule Rentals.User do
  use Ecto.Schema

  schema "users" do
    field(:name, :string)
    has_many(:rentals, Rentals.Rental)
  end
end
