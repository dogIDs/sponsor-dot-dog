defmodule SponsorDotDog.Repo.Migrations.CreateState do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :state_abbreviation, :string
      add :state_name, :string
      add :state_group, :integer

      timestamps
    end

  end
end
