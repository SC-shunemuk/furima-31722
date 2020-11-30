class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create

  end

  def order_params
    params.require(:order).permit(:address_code, :prefecture, :city, :address_number)
end
