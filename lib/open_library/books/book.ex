defmodule OpenLibrary.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :contact_person, :string
    field :contact, :string
    field :description, :string
    field :available, :boolean

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :contact_person, :contact, :description, :available])
    |> validate_required([:title, :contact_person, :contact])
  end
end
