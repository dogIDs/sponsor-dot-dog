defmodule SponsorDotDog.PetRescueTest do
  use SponsorDotDog.ModelCase

  alias SponsorDotDog.PetRescue

  @valid_attrs %{address1: "some content", address2: "some content", city: "some content", country: "some content", email: "some content", fax: "some content", phone: "some content", rescue_id: "some content", rescue_name: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PetRescue.changeset(%PetRescue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PetRescue.changeset(%PetRescue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
