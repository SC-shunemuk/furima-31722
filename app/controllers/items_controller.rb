class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :bear_price_id, :shipping_address_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
