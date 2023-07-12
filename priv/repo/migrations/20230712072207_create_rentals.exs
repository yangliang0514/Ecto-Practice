defmodule Rentals.Repo.Migrations.CreateRentals do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :rental_date, :date
      add :return_date, :date
      add :total_amount, :decimal
    end
  end
end
