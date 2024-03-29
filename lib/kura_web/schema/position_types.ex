defmodule KuraWeb.Schema.PositionTypes do
  use Absinthe.Schema.Notation

  alias KuraWeb.Resolvers
  alias KuraWeb.Schema.Middleware

  object :open_position do
    field :symbol, :string
    field :root, :string
    field :strategy, :string
    field :strategy_id, :string
    field :asset_type, :string
    field :trade_date, :date
    field :expiration, :date
    field :strike, :decimal
    field :option_type, :string
    field :quantity, :integer
    field :avg_price, :decimal
    field :book_cost, :decimal
    field :days_from_expiration, :integer
    field :days_to_expiration, :integer
    field :trading_account_id, :string
    field :trading_account_name, :string
  end

  object :closed_position do
    field :symbol, :string
    field :strategy, :string
    field :entry_date, :date
    field :exit_date, :date
    field :days_in_trade, :integer
    field :entry_cost, :decimal
    field :exit_cost, :decimal
    field :total_fees, :decimal
    field :realized_pnl, :decimal
    field :trading_account_id, :string
    field :trading_account_name, :string
  end

  @desc "List user positions"
  object :position_queries do
    field :open_positions, list_of(:open_position) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.Positions.open_positions/3)
    end

    field :closed_positions, list_of(:closed_position) do
      middleware(Middleware.Authorize)
      resolve(&Resolvers.Positions.closed_positions/3)
    end
  end
end
