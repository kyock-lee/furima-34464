class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :shipping_city, :shipping_adress, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id
    validates :shipping_city
    validates :shipping_adress
    validates :phone_number, format: {with: /\A[0-9]{11}+\z/}
    
    validates :order_id
    validates :user_id
    validates :item_id
  end
end