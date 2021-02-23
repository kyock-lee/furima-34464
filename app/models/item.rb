class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :cost, format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999}

    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_charge_id
      validates :shipping_area_id
      validates :shipping_day_id
      
    end
  end

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

end
