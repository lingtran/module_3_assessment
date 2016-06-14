class Api::V1::ItemsController < Api::ApiController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id].to_i)
  end

  

  def destroy
    Item.find(params[:id].to_i).destroy
    respond_with head: :no_content
  end
end
