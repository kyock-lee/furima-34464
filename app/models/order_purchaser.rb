class OrderPurchaser
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :shipping_city, :shipping_adress, :building_name, :phone_number, :order_id, :user_id, :item_id

  
end