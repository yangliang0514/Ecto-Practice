defmodule Rentals.Item do
  use Ecto.Schema

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    belongs_to(:categories, Rentals.Category)
  end
end
