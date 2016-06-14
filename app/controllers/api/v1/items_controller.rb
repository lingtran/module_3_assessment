class Api::V1::ItemsController < Api::ApiController
  before_filter :items_params, on: [:create]

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id].to_i)
  end

  def create
    new_item = Item.create(name: params[:name], description: params[:description], image_url: params[:image_url])
    respond_with Item.find_by(id: new_item.id)
  end

  def destroy
    Item.find(params[:id].to_i).destroy
    respond_with head: :no_content
  end

  private
  def items_params
    params.permit(:name, :description, :image_url)
  end
end
