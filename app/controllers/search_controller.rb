class SearchController < ApplicationController
  def index
    @stores = StoreSearchService.new(params['zipcode']).stores
  end
end
