class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, :description, :category_id, :status_id, :ship_fee_id, :ship_area_id, :ship_day_id, :price, :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :ship_area_id, numericality: { other_than: 1 }
  validates :ship_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_area
  belongs_to_active_hash :ship_day
end
