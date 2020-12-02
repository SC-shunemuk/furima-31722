class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :purchaser_to_index, :purchased_item]
  before_action :purchaser_to_index
  before_action :purchased_item 
  def index
    @purchase_form = PurchaseForm.new
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.permit(:address_code, :prefecture_id, :city, :address_number, :house_name, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchaser_to_index
    redirect_to root_path if current_user.id == @item.user_id 
  end

  def purchased_item
    @purchased_item = @item.purchase
    if @purchased_item
      redirect_to root_path 
    end
  end
end
