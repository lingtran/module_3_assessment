require 'rails_helper'

RSpec.describe BestBuyService do
  VCR.use_cassette("best_buy_get_stores") do
    describe "get stores by zipcode and location" do
      zipcode = "80202"
      location = "25"
      service = BestBuyService.new
      stores = service.parse_stores_by_zipcode_and_location(zipcode, location)
    end
  end
end
