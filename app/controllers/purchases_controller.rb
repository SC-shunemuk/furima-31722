class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new(purchase_params)   
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  private
  
  def purchase_params
    params.permit(:address_code, :prefecture_id, :city, :address_number, :house_name, :tel)
  end


end
