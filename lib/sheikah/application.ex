defmodule Sheikah.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Sheikah.Repo,
      # Start the Telemetry supervisor
      SheikahWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sheikah.PubSub},
      # Start the Endpoint (http/https)
      SheikahWeb.Endpoint
      # Start a worker by calling: Sheikah.Worker.start_link(arg)
      # {Sheikah.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sheikah.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SheikahWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
