class OrderForm
  include Activemodel::Model
  attr_accessor :address_code, :prefecture, :city, :address_number, :house_name, :tel,

  with_options presence: true do
    validates :address_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address_number
    validates :house_name
    validates :tel, format: { with: /^[0-9]+$/}
    validates :prefecture, numericality:{ other_than: 0}

  end

  def save
    user = User.find(parmas[:id])
    item = Item.find(params[:user_id])
    Address.create(address_code: address_code, prefecture: prefecture, city: city, address_number: address_number, house_name: house_name, tel: tel)
    Purchase.create(user_id: user.id, item_id: item.id)
  end
end