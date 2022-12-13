defmodule OpenLibraryWeb.BookController do
  use OpenLibraryWeb, :controller

  alias OpenLibrary.Books
  alias OpenLibrary.Books.Book

  def index(conn, _params) do
    books = Books.list_books()
    render(conn, "index.html", books: books)
  end

  def new(conn, _params) do
    changeset = Books.change_book(%Book{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"book" => book_params}) do
    case Books.create_book(book_params) do
      {:ok, _book} ->
        conn
        |> put_flash(:info, "Book created successfully.")
        |> redirect(to: Routes.book_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    render(conn, "show.html", book: book)
  end

  def edit(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    changeset = Books.change_book(book)
    render(conn, "edit.html", book: book, changeset: changeset)
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    book = Books.get_book!(id)
    IO.inspect(book)
    IO.inspect(book_params)

    case Books.update_book(book, book_params) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Buch erfolgreich geupdated.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", book: book, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    book = Books.get_book!(id)
    {:ok, _book} = Books.delete_book(book)

    conn
    |> put_flash(:info, "Book deleted successfully.")
    |> redirect(to: Routes.book_path(conn, :index))
  end

  def book_availability_toggler(book) when book.available == true do
    false
  end

  def book_availability_toggler(book) when book.available == false do
    true
  end

  def take(conn, %{"id" => id}) do
    book = Books.get_book!(id)

    case Books.update_book(
           book,
           %{
             title: book.title,
             contact_person: book.contact_person,
             contact: book.contact,
             description: book.description,
             available: book_availability_toggler(book)
           }
         ) do
      {:ok, book} ->
        conn
        |> put_flash(:info, "Buch erfolgreich geupdated.")
        |> redirect(to: Routes.book_path(conn, :show, book))

      {:error} ->
        render(conn, "show.html", book: book)
    end
  end
end
