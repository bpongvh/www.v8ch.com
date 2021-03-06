use Mix.Config

# General application config
config :v8ch,
  env: "test"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :v8ch, V8chWeb.Endpoint,
  http: [port: 4001],
  secret_key_base: "NK1Bcoh5qBnKcqy9DOZoh4MHLPLtcXqst2pd6ArCyc1l1gtvbKprIxG+oMGQLv9N",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :v8ch, V8ch.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "v8ch_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
