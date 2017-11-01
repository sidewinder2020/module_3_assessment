class SearchController < ApplicationController
  def create
    @stores = StoreSearchService.new(params['zipcode']).stores
  end
end
