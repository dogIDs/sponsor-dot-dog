defmodule SponsorDotDog.PetRescue do
  use SponsorDotDog.Web, :model

  schema "petrescues" do
    field :rescue_id, :string
    field :rescue_name, :string
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :zip, :string
    field :country, :string
    field :phone, :string
    field :fax, :string
    field :email, :string
    belongs_to :state, SponsorDotDog.State
    has_many :dogs, SponsorDotDog.Dog


    timestamps
  end

  @required_fields ~w(rescue_id rescue_name address1 city zip)
  @optional_fields ~w(address2 country phone fax email)

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
