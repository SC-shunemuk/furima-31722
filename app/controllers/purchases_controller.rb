class PurchasesController < ApplicationController
  def index
  end

  def create

  end

  def purchase_params
    params.require(:purchase).permit(:address_code, :prefecture, :city, :address_number)
  end
end
