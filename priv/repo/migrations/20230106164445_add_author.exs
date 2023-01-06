defmodule OpenLibrary.Repo.Migrations.AddAuthor do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :author, :string
    end
  end
end
