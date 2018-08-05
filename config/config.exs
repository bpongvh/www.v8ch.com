# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :v8ch,
  contacts_module: V8ch.Contacts,
  contexts_module: V8ch.Contexts,
  featured_links_module: V8ch.ContentTypes,
  posts_module: V8ch.ContentTypes,
  ecto_repos: [V8ch.Repo]

# Configures the endpoint
config :v8ch, V8chWeb.Endpoint,
  render_errors: [view: V8chWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: V8ch.PubSub, adapter: Phoenix.PubSub.PG2]

config :v8ch, V8ch.Mailer,
  adapter: Bamboo.MailgunAdapter,
  domain: "v8ch.com"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :pid_file, file: "./v8ch.pid"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
