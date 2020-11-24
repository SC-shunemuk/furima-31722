class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :image, :category_id, :status_id, :bear_price_id, :shipping_address_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
