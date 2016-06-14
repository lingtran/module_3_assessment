class SearchController < ApplicationController
  def index
    binding.pry
    @stores = Store.find_all_by_zipcode(params["Zip Code"])
  end
end
