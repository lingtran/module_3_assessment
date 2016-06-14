require 'rails_helper'

RSpec.describe Store, type: :model do
  VCR.use_cassette"#best_buy_get_stores" do
    describe "#find all by zipcode" do
      it "can find stores by zipcode pulling from Best Buy Service" do
        search_zip = "80202"
        stores = Store.find_all_by_zipcode(search_zip)

        expect(stores.count).to eq(17)
      end
    end
  end
end
