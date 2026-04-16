defmodule PlanningCenterPlaygroundWeb.Resolvers.Accounts do
  alias PlanningCenterPlayground.Accounts
  alias PlanningCenterPlayground.Auth.Guardian

  def register(_parent, %{email: email, password: password}, _resolution) do
    case Accounts.register_user(%{email: email, password: password}) do
      {:ok, user} ->
        {:ok, %{token: generate_token(user), user: user}}

      {:error, changeset} ->
        {:error, format_errors(changeset)}
    end
  end

  def login(_parent, %{email: email, password: password}, _resolution) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, %{token: generate_token(user), user: user}}

      {:error, :invalid_credentials} ->
        {:error, "Invalid email or password"}
    end
  end

  defp generate_token(user) do
    {:ok, token, _claims} = Guardian.encode_and_sign(user)
    token
  end

  defp format_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
    |> Enum.map(fn {field, errors} -> "#{field}: #{Enum.join(errors, ", ")}" end)
    |> Enum.join("; ")
  end
end
