class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)   
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  private
  
  def purchase_params
    params.require(:purchase).permit(:address_code, :prefecture, :city, :address_number, :house_name, :tel)
  end


end
