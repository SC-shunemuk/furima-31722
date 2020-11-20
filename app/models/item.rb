class Item < ApplicationRecord
  with_options presence: true do
    
    validates :name
    validates :content
    validates :price
    validates :category_id
    validates :status_id
    validates :bear_price_id
    validates :shipping_address_id
    validates :shipping_day_id
  end
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :bear_price
  belongs_to :shipping_address
  belongs_to :shipping_day

  with_options numericality: {other_than: 1} do
    validates :category_id
    validates :status_id
    validates :bear_price_id
    validates :shipping_address_id
    validates :shipping_day_id
  end
end
