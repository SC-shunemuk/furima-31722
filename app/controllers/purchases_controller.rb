class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_form = PurchaseForm.new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end


end
