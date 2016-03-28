defmodule SponsorDotDog.Repo.Migrations.CreateDog do
  use Ecto.Migration

  def change do
    create table(:dogs) do
      add :pet_id, :string
      add :name, :string
      add :animal, :string
      add :mix, :string
      add :age, :string
      add :sex, :string
      add :options, :string
      add :description, :string
      add :last_update, :date
      add :photo_1, :string
      add :photo_2, :string
      add :rescue_id, references(:petrescues, on_delete: :nothing)

      timestamps
    end
    create index(:dogs, [:rescue_id])

  end
end
