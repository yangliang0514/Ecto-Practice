defmodule Rentals.Repo.Migrations.AddForeignKeyToRentals do
  use Ecto.Migration

  def change do
    alter table(:rentals) do
      add :user_id, :integer
      add :item_id, references(:items)
    end
  end
end
