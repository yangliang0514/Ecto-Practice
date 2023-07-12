defmodule Rentals.Category do
  use Ecto.Schema

  schema "categories" do
    field(:name, :string)
  end
end
