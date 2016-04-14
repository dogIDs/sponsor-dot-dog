defmodule SponsorDotDog.StateControllerTest do
  use SponsorDotDog.ConnCase

  alias SponsorDotDog.State
  @valid_attrs %{state_abbreviation: "some content", state_name: "some content"}
  @invalid_attrs %{}

  test "shows chosen resource", %{conn: conn} do
    state = Repo.insert! %State{}
    conn = get conn, state_path(conn, :show, state)
    assert html_response(conn, 200) =~ "Show state"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, state_path(conn, :show, -1)
    end
  end
end
