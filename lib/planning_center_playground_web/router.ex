defmodule PlanningCenterPlaygroundWeb.Router do
  use PlanningCenterPlaygroundWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PlanningCenterPlaygroundWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:planning_center_playground, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PlanningCenterPlaygroundWeb.Telemetry
    end
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: PlanningCenterPlaygroundWeb.Schema

    if Application.compile_env(:planning_center_playground, :dev_routes) do
      forward "/graphiql", Absinthe.Plug.GraphiQL,
        schema: PlanningCenterPlaygroundWeb.Schema,
        socket: PlanningCenterPlaygroundWeb.Endpoint
    end
  end

  scope "/", PlanningCenterPlaygroundWeb do
    pipe_through :browser

    # Catch-all: serve the React SPA for every non-API route.
    # Must come last so specific routes above are matched first.
    get "/*path", PageController, :home
  end
end
