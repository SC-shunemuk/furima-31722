class PurchaseForm
  include ActiveModel::Model
  attr_accessor :address_code, :prefecture_id, :city, :address_number, :house_name, :tel ,:user_id, :item_id, :token

  with_options presence: true do
    validates :address_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address_number
    validates :tel, format: { with: /\A\d{10,11}\z/}
    validates :prefecture_id, numericality:{ other_than: 1}
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(address_code: address_code, prefecture_id: prefecture_id, city: city, address_number: address_number, house_name: house_name, tel: tel, purchase_id: purchase.id)
  end
end
