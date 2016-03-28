defmodule SponsorDotDog.Router do
  use SponsorDotDog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SponsorDotDog do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/states/:state_abbreviation", StateController, :show
    resources "/pet_rescues", PetRescueController, only: [:index, :show , :create], param: "rescue_id"
    resources "/dogs", DogController, only: [:index, :show, :create], param: "pet_id"
  end

  # Other scopes may use custom stacks.
  # scope "/api", SponsorDotDog do
  #   pipe_through :api
  # end
end
