defmodule SponsorDotDog.DogTest do
  use SponsorDotDog.ModelCase

  alias SponsorDotDog.Dog

  @valid_attrs %{age: "some content", animal: "some content", description: "some content", last_update: "2010-04-17", mix: "some content", name: "some content", options: "some content", pet_id: "some content", photo_1: "some content", photo_2: "some content", sex: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dog.changeset(%Dog{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dog.changeset(%Dog{}, @invalid_attrs)
    refute changeset.valid?
  end
end
