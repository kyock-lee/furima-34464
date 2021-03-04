class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :shipping_city, :shipping_address, :building_name, :phone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_city
    validates :shipping_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id

    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Purchaser.create(post_code: post_code, shipping_area_id: shipping_area_id, shipping_city: shipping_city,
                     shipping_address: shipping_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
