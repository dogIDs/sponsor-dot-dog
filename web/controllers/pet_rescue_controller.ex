defmodule SponsorDotDog.PetRescueController do
  use SponsorDotDog.Web, :controller

  alias SponsorDotDog.PetRescue

  plug :scrub_params, "pet_rescue" when action in [:create, :update]

  def create(conn, %{"pet_rescue" => pet_rescue_params}) do
    changeset = PetRescue.changeset(%PetRescue{}, pet_rescue_params)

    case Repo.insert(changeset) do
      {:ok, _pet_rescue} ->
        conn
        |> put_flash(:info, "Pet rescue created successfully.")
        |> redirect(to: pet_rescue_path(conn, :show, pet_rescue_params.id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, params) do
    render(conn, "index.html", shelter_id: params["shelter"])
  end

  def show(conn, %{"rescue_id" => rescue_id}) do
    exists = Repo.get(PetRescue, rescue_id: rescue_id)
    if exists do
      pet_rescue = Repo.get!(PetRescue, rescue_id: rescue_id)
      state = Repo.get!(State, pet_rescue.state_id)
      render(conn, "show.html", pet_rescue: pet_rescue, state: state)
    else
      render(conn, "show.html")
    end
  end

end
