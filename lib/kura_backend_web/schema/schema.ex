defmodule KuraBackendWeb.Schema do
  use Absinthe.Schema

  alias KuraBackendWeb.Schema

  import_types(Schema.UserTypes)
  import_types(Schema.TradingAccountTypes)

  query do
    import_fields(:user)
    import_fields(:trading_accounts)
  end

  mutation do
    import_fields(:login_mutation)
    import_fields(:create_user_mutation)
  end
end