class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :item
  has_one :address
end
