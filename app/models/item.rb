class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :bear_price_id
    validates :shipping_address_id
    validates :shipping_day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :bear_price
  belongs_to :shipping_address
  belongs_to :shipping_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :bear_price_id
    validates :shipping_address_id
    validates :shipping_day_id
  end

  default_scope { order(created_at: :desc) }
end
