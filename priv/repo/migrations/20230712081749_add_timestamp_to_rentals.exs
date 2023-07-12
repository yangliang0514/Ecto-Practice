defmodule Rentals.Repo.Migrations.AddTimestampToRentals do
  use Ecto.Migration

  def change do
    alter table(:rentals) do
      timestamps()
    end
  end
end
