import Config

config :elixir_react_todo,
  ecto_repos: [ElixirReactTodo.Repo]

# Configures the endpoint
config :elixir_react_todo, ElixirReactTodoWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirReactTodoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ElixirReactTodo.PubSub,
  live_view: [signing_salt: "M64JTze9"]

config :elixir_react_todo, ElixirReactTodo.Mailer, adapter: Swoosh.Adapters.Local
config :swoosh, :api_client, false

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/* --loader:.js=jsx),
    cd: Path.expand("../client", __DIR__),
    env: %{
      "NODE_PATH" =>
        Enum.join(
          [Path.expand("../deps", __DIR__), Path.expand("../client/node_modules", __DIR__)],
          ":"
        )
    }
  ]

config :dart_sass,
  version: "1.43.4",
  default: [
    args: ~w(src/scss/index.scss ../priv/static/assets/app.css),
    cd: Path.expand("../client", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
