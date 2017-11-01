class BestBuyApiService

  #https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&pageSize=10&apiKey=6tmxnbn286qhnt4act7h3tt8

  def initialize
    @conn = Faraday.new('https://api.bestbuy.com/v1/') do |faraday|
      faraday.headers["X-API-KEY"] = "ENV['best_buy_api_key']"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_by_zipcode(zipcode)
    response = @conn.get("stores(area(#{zipcode},25))?format=json&pageSize=10&apiKey=6tmxnbn286qhnt4act7h3tt8")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  attr_reader :conn
end
