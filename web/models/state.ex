defmodule SponsorDotDog.State do
  use SponsorDotDog.Web, :model

  schema "states" do
    field :state_abbreviation, :string
    field :state_name, :string
    field :state_group, :integer

    has_many :pet_rescues, SponsorDotDog.PetRescue

    timestamps
  end

  @required_fields ~w(state_abbreviation state_name)
  @optional_fields ~w()

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
