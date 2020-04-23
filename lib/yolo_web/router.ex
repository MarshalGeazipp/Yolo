defmodule YoloWeb.Router do
  use YoloWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YoloWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/uploads", UploadController, only: [:new, :create]
    get "/webcam", WebcamController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", YoloWeb do
  #   pipe_through :api
  # end

  if Mix.env() == :dev do
    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard"
    end
  end
end
