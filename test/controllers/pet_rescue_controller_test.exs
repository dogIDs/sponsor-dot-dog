defmodule SponsorDotDog.PetRescueControllerTest do
  use SponsorDotDog.ConnCase

  alias SponsorDotDog.PetRescue
  @valid_attrs %{address1: "some content", address2: "some content", city: "some content", country: "some content", email: "some content", fax: "some content", phone: "some content", rescue_id: "some content", rescue_name: "some content", zip: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pet_rescue_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing petrescues"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pet_rescue_path(conn, :create), pet_rescue: @valid_attrs
    assert redirected_to(conn) == pet_rescue_path(conn, :index)
    assert Repo.get_by(PetRescue, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pet_rescue_path(conn, :create), pet_rescue: @invalid_attrs
    assert html_response(conn, 200) =~ "New pet rescue"
  end

  test "shows chosen resource", %{conn: conn} do
    pet_rescue = Repo.insert! %PetRescue{}
    conn = get conn, pet_rescue_path(conn, :show, pet_rescue)
    assert html_response(conn, 200) =~ "Show pet rescue"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pet_rescue_path(conn, :show, -1)
    end
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pet_rescue = Repo.insert! %PetRescue{}
    conn = put conn, pet_rescue_path(conn, :update, pet_rescue), pet_rescue: @valid_attrs
    assert redirected_to(conn) == pet_rescue_path(conn, :show, pet_rescue)
    assert Repo.get_by(PetRescue, @valid_attrs)
  end
end
