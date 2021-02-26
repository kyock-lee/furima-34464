FactoryBot.define do
  factory :item do
    item_name { 'サンプル商品' }
    description                       { 'サンプル商品の説明' }
    category_id                       { 2 }
    status_id                         { 2 }
    shipping_charge_id                { 2 }
    shipping_area_id                  { 2 }
    shipping_day_id                   { 2 }
    cost                              { 500 }

    association :user
  end
end
