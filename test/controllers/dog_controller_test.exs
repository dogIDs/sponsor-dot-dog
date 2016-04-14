defmodule SponsorDotDog.DogControllerTest do
  use SponsorDotDog.ConnCase

  alias SponsorDotDog.Dog
  @valid_attrs %{age: "some content", animal: "some content", description: "some content", last_update: "2010-04-17", mix: "some content", name: "some content", options: "some content", pet_id: "some content", photo_1: "some content", photo_2: "some content", sex: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dog_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing dogs"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dog_path(conn, :create), dog: @valid_attrs
    assert redirected_to(conn) == dog_path(conn, :index)
    assert Repo.get_by(Dog, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dog_path(conn, :create), dog: @invalid_attrs
    assert html_response(conn, 200) =~ "New dog"
  end

  test "shows chosen resource", %{conn: conn} do
    dog = Repo.insert! %Dog{}
    conn = get conn, dog_path(conn, :show, dog)
    assert html_response(conn, 200) =~ "Show dog"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, dog_path(conn, :show, -1)
    end
  end
end
