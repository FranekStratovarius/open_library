defmodule OpenLibrary.Repo.Migrations.InitTables do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :contact_person, :string
      add :contact, :string
      add :description, :text
      add :available, :boolean, default: true

      timestamps()
    end
  end
end
