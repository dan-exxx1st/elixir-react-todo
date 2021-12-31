defmodule ElixirReactTodo.Repo do
  use Ecto.Repo,
    otp_app: :elixir_react_todo,
    adapter: Ecto.Adapters.Postgres
end
