class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create

  end

  def purchase_params
    params.require(:purchase).permit(:address_code, :prefecture, :city, :address_number)
  end
end
