defmodule SponsorDotDog.PageController do
  use SponsorDotDog.Web, :controller

  alias SponsorDotDog.State

  def index(conn, _params) do
    states = Repo.all(State)
    render(conn, "index.html", states: states)
  end
end
