# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :board_app,
  ecto_repos: [BoardApp.Repo]

# Configures the endpoint
config :board_app, BoardAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PxZjDXdJVxM847G81367dIk9dimNGnN2Cbp6cKOL9H9Rwv/ZkM54eNdc3RMaXgiS",
  render_errors: [view: BoardAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BoardApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
