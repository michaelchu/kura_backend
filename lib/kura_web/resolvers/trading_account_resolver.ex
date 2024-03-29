defmodule KuraWeb.Resolvers.TradingAccount do
  alias Kura.TradingAccounts

  def list_trading_accounts(_root, _args, %{context: %{current_user: current_user}}) do
    {:ok, TradingAccounts.list_trading_accounts(current_user.id)}
  end
end
