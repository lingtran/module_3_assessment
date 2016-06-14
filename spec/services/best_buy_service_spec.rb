require 'rails_helper'

RSpec.describe BestBuyService do
  VCR.use_cassette("best_buy_get_stores") do
    describe "get stores" do
      it "returns stores based on zipcode and location" do
        zipcode = "80202"
        service = BestBuyService.new
        response = service.parse_stores_by_zipcode(zipcode)

        expect(response[:total]).to eq(17)
        expect(response[:stores].count).to eq(17)
        expect(response[:stores].first.keys).to include(:longName, :city, :distance, :phone, :storeType)
      end
    end
  end
end
