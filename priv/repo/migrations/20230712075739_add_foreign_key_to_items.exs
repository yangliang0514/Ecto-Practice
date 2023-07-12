defmodule Rentals.Repo.Migrations.AddForeignKeyToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :category_id, references(:categories)

      timestamps()
    end
  end
end
