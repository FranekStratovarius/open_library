defmodule OpenLibrary.Repo do
  use Ecto.Repo,
    otp_app: :open_library,
    adapter: Ecto.Adapters.MyXQL
end
