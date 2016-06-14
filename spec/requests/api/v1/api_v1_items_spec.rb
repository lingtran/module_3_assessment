require 'rails_helper'

RSpec.describe "Api::V1::ItemsController", type: :request do
  describe "Index" do
    before(:each) do
      @item_one, item_two = create_list(:item, 2)

      get '/api/v1/items'
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

  describe "Show" do
    before(:each) do
      @item_one, @item_two = create_list(:item, 2)

      get "/api/v1/items/#{@item_one.id}"
    end

    it "provides a response for specific item" do
      expect(response).to have_http_status(200)
      expect(response).to be_success
    end

    it "provides information for a specific item" do
      expect(response_body[:name]).to eq(@item_one.name)
      expect(response_body[:name]).not_to eq(@item_two.name)
      expect(response_body[:description]).to eq(@item_one.description)
      expect(response_body[:image_url]).to eq(@item_one.image_url)
    end
  end

  describe "Delete" do
    # When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON response if the record is successfully deleted
    before(:each) do
      @item_one, @item_two = create_list(:item, 2)

      delete "/api/v1/items/#{@item_one.id}"
    end

    it "provides a response for deleted item" do
      binding.pry
      expect(response).to have_http_status(204)
      expect(response).to be_success
    end

    it "removes the item" do
    end

  end

end
