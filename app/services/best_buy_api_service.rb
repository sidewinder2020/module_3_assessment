class BestBuyApiService

  def initialize
    @conn = Faraday.new('https://api.bestbuy.com/v1/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_by_zipcode(zipcode)
    response = @conn.get("stores(area(#{zipcode},25))?format=json&pageSize=100&apiKey=#{ENV['best_buy_api_key']}")
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  private

  attr_reader :conn
end
