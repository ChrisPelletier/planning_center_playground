defmodule PlanningCenterPlaygroundWeb.PageController do
  use PlanningCenterPlaygroundWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
