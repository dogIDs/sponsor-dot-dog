defmodule SponsorDotDog.StateController do
  use SponsorDotDog.Web, :controller

  alias SponsorDotDog.State
  alias SponsorDotDog.PetRescue

  def show(conn, %{"state_abbreviation" => state_abbreviation}) do
    state = Repo.get_by!(State, state_abbreviation: state_abbreviation)
    pet_rescues = Repo.all(from p in PetRescue, where: p.state_id == ^state.id)
    render(conn, "show.html", state: state, pet_rescues: pet_rescues)
  end

end
