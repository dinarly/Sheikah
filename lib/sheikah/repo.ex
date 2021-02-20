defmodule Sheikah.Repo do
  use Ecto.Repo,
    otp_app: :sheikah,
    adapter: Ecto.Adapters.Postgres
end
