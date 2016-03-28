defmodule SponsorDotDog.DogController do
  use SponsorDotDog.Web, :controller

  alias SponsorDotDog.Dog

  plug :scrub_params, "dog" when action in [:create, :update]

  def create(conn, %{"dog" => dog_params}) do
    changeset = Dog.changeset(%Dog{}, dog_params)

    case Repo.insert(changeset) do
      {:ok, _dog} ->
        conn
        |> put_flash(:info, "Dog created successfully.")
        |> redirect(to: pet_rescue_path(conn, :show, dog_params.rescue_id))
      {:error, _dog} ->
        conn
        |> put_flash(:error, "There was an error.")
        |> redirect(to: pet_rescue_path(conn, :index))
    end
  end

  def index(conn, params) do
    render(conn, "index.html", dog_id: params["dog_id"])
  end

  def show(conn, %{"pet_id" => pet_id}) do
    dog = Repo.get!(Dog, pet_id: pet_id)
    render(conn, "show.html", dog: dog)
  end

end
