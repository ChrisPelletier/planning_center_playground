defmodule PlanningCenterPlayground.Auth.Guardian do
  use Guardian, otp_app: :planning_center_playground

  alias PlanningCenterPlayground.Accounts

  # Called when creating a token — what do we store as the "subject"?
  # We store the user's ID as a string.
  def subject_for_token(%{id: id}, _claims), do: {:ok, to_string(id)}
  def subject_for_token(_, _), do: {:error, :invalid_resource}

  # Called when verifying a token — turn the stored subject back into a resource.
  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_user(id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def resource_from_claims(_), do: {:error, :invalid_claims}
end
