class SearchController < ApplicationController
  def index
    @stores = Store.find_all_by_zipcode(params["Zip Code"])
    binding.pry
  end
end
