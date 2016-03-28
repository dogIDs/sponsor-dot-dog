defmodule SponsorDotDog.Dog do
  use SponsorDotDog.Web, :model

  schema "dogs" do
    field :pet_id, :string
    field :name, :string
    field :animal, :string
    field :mix, :string
    field :age, :string
    field :sex, :string
    field :options, :string
    field :description, :string
    field :last_update, Ecto.Date
    field :photo_1, :string
    field :photo_2, :string
    belongs_to :rescue, SponsorDotDog.Rescue

    timestamps
  end

  @required_fields ~w(pet_id name animal description last_update)
  @optional_fields ~w(mix age sex options photo_1 photo_2)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
