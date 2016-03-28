ExUnit.start

Mix.Task.run "ecto.create", ~w(-r SponsorDotDog.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r SponsorDotDog.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(SponsorDotDog.Repo)

