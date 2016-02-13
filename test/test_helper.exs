ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Minty.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Minty.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Minty.Repo)

