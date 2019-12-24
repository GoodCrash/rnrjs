defmodule Rnrjs.Repo do
  use Ecto.Repo,
    otp_app: :rnrjs,
    adapter: Ecto.Adapters.Postgres
end
