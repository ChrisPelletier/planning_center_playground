# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :planning_center_playground,
  ecto_repos: [PlanningCenterPlayground.Repo],
  generators: [timestamp_type: :utc_datetime],
  env: config_env()

# Configure the endpoint
config :planning_center_playground, PlanningCenterPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [
      html: PlanningCenterPlaygroundWeb.ErrorHTML,
      json: PlanningCenterPlaygroundWeb.ErrorJSON
    ],
    layout: false
  ],
  pubsub_server: PlanningCenterPlayground.PubSub,
  live_view: [signing_salt: "akZqJAQv"]

# Configure Elixir's Logger
config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :planning_center_playground, PlanningCenterPlayground.Auth.Guardian,
  issuer: "planning_center_playground",
  secret_key: "TSDSsszCJ3QN5hN2g4WhxfYvS4V4dHYqCG-LeIah32BUx5KFxagAg8AzLu0cbp_f"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
