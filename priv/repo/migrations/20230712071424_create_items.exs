defmodule Rentals.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :text
    end
  end
end
