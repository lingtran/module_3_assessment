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
    before(:each) do
      @item_one, @item_two = create_list(:item, 2)

      delete "/api/v1/items/#{@item_one.id}"
    end

    it "provides a response for deleted item" do
      expect(response).to have_http_status(204)
      expect(response).to be_success
    end

    it "removes the item" do
      expect(Item.all).not_to include(@item_one)
    end
  end

  describe "Create" do
    # to /api/v1/items with a name, description, and image_url I receive a 201 JSON response if the record is successfully created

    before(:each) do
      @item_one, @item_two = create_list(:item, 2)
      @new_item = { name: "new item", description: "new description", image_url: "http://rs304.pbsrc.com/albums/nn179/SAMIREGGAETON/hellokitty024.gif~c200"}
      post "/api/v1/items?name=#{@new_item[:name]}&description=#{@new_item[:description]}&image_url=#{@new_item[:image_url]}"
    end

    it "provides a response for creating item" do
      expect(response).to have_http_status(201)
      expect(response).to be_success
    end

    it "creates the item" do
      expect(@item_one[:name]).not_to eq(@new_item[:name])
      expect(@item_two[:name]).not_to eq(@new_item[:name])
      expect(Item.last[:name]).to eq(@new_item[:name])
      expect(response_body[:name]).to eq(@new_item[:name])
      expect(response_body[:description]).to eq(@new_item[:description])
      expect(response_body[:image_url]).to eq(@new_item[:image_url])
    end
  end

end
