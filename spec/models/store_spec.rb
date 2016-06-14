require 'rails_helper'

RSpec.describe Store, type: :model do
  describe "#find all by zipcode" do
    it "can find stores by zipcode pulling from Best Buy Service" do
      search_zip = "80202"
      store = Store.find_all_by_zipcode(search_zip)

    end
  end
end
