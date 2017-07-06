class FinancesController < ApplicationController

  def create
    yahoo_client = YahooFinance::Client.new

    data = yahoo_client.quotes(["gold", "gas", "oil", "fish", "wood"], [:last_trade_price, :symbol])

    data.each do |item|
      @finance = Finance.new(symbol: item.symbol, price: item.last_trade_price)
      @finance.save
    end

    redirect_to "start_track"
  end

  def start_track
    @result = Finance.first(5)
  end

end
