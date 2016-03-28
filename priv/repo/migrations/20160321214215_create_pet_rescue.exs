defmodule SponsorDotDog.Repo.Migrations.CreatePetRescue do
  use Ecto.Migration

  def change do
    create table(:petrescues) do
      add :rescue_id, :string
      add :rescue_name, :string
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :zip, :string
      add :country, :string
      add :phone, :string
      add :fax, :string
      add :email, :string
      add :state_id, references(:states, on_delete: :nothing)

      timestamps
    end
    create index(:petrescues, [:state_id])

  end
end
