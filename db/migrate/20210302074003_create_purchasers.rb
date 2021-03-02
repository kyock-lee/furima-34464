class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|

      t.timestamps
      t.string     :post_code,           null: false
      t.integer    :shipping_area_id,    null: false
      t.string     :shipping_city,       null: false
      t.string     :shipping_address,    null: false
      t.string     :building_name
      t.string     :phone_number,        null: false
      t.references :order,               null: false, foreign_key: true

    end
  end
end
