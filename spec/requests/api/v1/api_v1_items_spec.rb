require 'rails_helper'

RSpec.describe "Api::V1::ItemsController", type: :request do
  describe "GET /api_v1_items" do
    before(:each) do
      @item_one, item_two = create_list(:item, 2)
      get 'api/v1/items'
    end

    it "provides a response for items" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "provides a list of all items" do
      expect(response_body.count).to eq(2)
      expect(response_body.first[:name]).to eq(@item_one.name)
      expect(response_body.first[:description]).to eq(@item_one.description)
      expect(response_body.first[:image_url]).to eq(@item_one.image_url)
    end
  end
end

 # I receive a 200 JSON response containing all items And each item has a name, description, and image_url but not the created_at or updated_at
