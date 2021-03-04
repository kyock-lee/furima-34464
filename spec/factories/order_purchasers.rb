FactoryBot.define do
  factory :order_purchaser do
    token            { 'tok_abcdefghijk00000000000000000' }
    post_code        { '123-4567' }
    shipping_area_id { 5 }
    shipping_city    { '仙台市太白区' }
    shipping_address { '長町1−1−1' }
    building_name    { '長町ハイツ' }
    phone_number     { '01234567811' }

    # formオブジェクトはアソシエーションを組めない
  end
end
