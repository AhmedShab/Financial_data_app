namespace :track do
  desc "Capture at five commodity prices from Yahoo Finance"
  task fetch: :environment do

    yahoo_client = YahooFinance::Client.new

    data = yahoo_client.quotes(["gold", "gas", "oil", "fish", "wood"], [:last_trade_price, :symbol])

    data.each do |item|
      @finance = Finance.new(symbol: item.symbol, price: item.last_trade_price)
      @finance.save
    end
      puts "#{Time.now} - Success!"
  end

end
