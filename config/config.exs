# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphql_sydney,
  ecto_repos: [GraphqlSydney.Repo]

# Configures the endpoint
config :graphql_sydney, GraphqlSydney.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0poZl48Bg1fGXRi+WECHaJCKi9yVPIT4wW+gcmg3xwzm7G2X9gvUBoZt7rvYF2+p",
  render_errors: [view: GraphqlSydney.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GraphqlSydney.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
