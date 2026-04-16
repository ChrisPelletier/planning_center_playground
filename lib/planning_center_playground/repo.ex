defmodule PlanningCenterPlayground.Repo do
  use Ecto.Repo,
    otp_app: :planning_center_playground,
    adapter: Ecto.Adapters.Postgres
end
