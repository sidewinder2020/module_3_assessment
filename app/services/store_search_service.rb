class StoreSearchService
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stores
    raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end

  private

    def raw_stores
      raw_stores = BestBuyApiService.new.find_by_zipcode(zipcode)
    end

    attr_reader :zipcode
end
