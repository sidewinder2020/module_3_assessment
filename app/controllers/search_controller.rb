class SearchController < ApplicationController
  def index
    @stores = StoreSearch.new(params['zipcode']).stores
  end
end
