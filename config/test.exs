use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sponsor_dot_dog, SponsorDotDog.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :sponsor_dot_dog, SponsorDotDog.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "sponsor_dot_dog_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
