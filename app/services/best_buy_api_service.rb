class BestBuyApiService
  def initialize
    @conn = Faraday.new('') do |faraday|
      faraday.headers["X-API-KEY"] = "ENV['best_buy_api_key']"
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_by_zipcode(zipcode)
    response = @conn.get("#{zipcode}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  attr_reader :conn
end
