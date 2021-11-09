defmodule TestJsCommands.Repo do
  use Ecto.Repo,
    otp_app: :test_js_commands,
    adapter: Ecto.Adapters.Postgres
end
