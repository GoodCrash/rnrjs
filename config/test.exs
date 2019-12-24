use Mix.Config

# Configure your database
config :rnrjs, Rnrjs.Repo,
  username: "phoenix",
  password: "123456",
  database: "rnrjs_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rnrjs, RnrjsWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
