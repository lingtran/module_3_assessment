require 'rails_helper'

RSpec.describe "Api::V1::ItemsController", type: :request do
  describe "Items Index" do
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

  describe "Items Show" do
    before(:each) do
      @item_one, @item_two = create_list(:item, 2)

      get "api/v1/items/#{@item_one.id}"
    end

    it "provides a response for items" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "provides a list of all items" do
      expect(response_body[:name]).to eq(@item_one.name)
      expect(response_body[:name]).not_to eq(@item_two.name)
      expect(response_body[:description]).to eq(@item_one.description)
      expect(response_body[:image_url]).to eq(@item_one.image_url)
    end
  end

end
