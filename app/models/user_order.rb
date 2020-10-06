class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone, format: { with: /\A[0-9]+\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, order_id: order.id)
  end
end
