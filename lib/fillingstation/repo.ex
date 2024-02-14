defmodule Fillingstation.Repo do
  use Ecto.Repo,
    otp_app: :fillingstation,
    adapter: Ecto.Adapters.Postgres
end
