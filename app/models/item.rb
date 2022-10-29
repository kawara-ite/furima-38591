class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  # has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  validates :name, :info, :price, :image, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Price is invalid. Input half-width characters' } do
    validates :price, numericality: { in: 300..9_999_999, message: 'Price is out of setting range'}
  end
end
