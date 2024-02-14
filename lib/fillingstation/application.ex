defmodule Fillingstation.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FillingstationWeb.Telemetry,
      # Start the Ecto repository
      Fillingstation.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fillingstation.PubSub},
      # Start Finch
      {Finch, name: Fillingstation.Finch},
      # Start the Endpoint (http/https)
      FillingstationWeb.Endpoint
      # Start a worker by calling: Fillingstation.Worker.start_link(arg)
      # {Fillingstation.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fillingstation.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FillingstationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
