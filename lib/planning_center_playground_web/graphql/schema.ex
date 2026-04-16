defmodule PlanningCenterPlaygroundWeb.Schema do
  use Absinthe.Schema

  import_types PlanningCenterPlaygroundWeb.Schema.AccountTypes

  alias PlanningCenterPlaygroundWeb.Resolvers

  query do
    field :health, :string do
      resolve fn _, _, _ -> {:ok, "ok"} end
    end
  end

  mutation do
    field :register, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &Resolvers.Accounts.register/3
    end

    field :login, :session do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &Resolvers.Accounts.login/3
    end
  end
end
