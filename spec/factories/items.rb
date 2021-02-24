FactoryBot.define do
  factory :item do

        item_name                         {Faker::Name.initials(number: 2)}
        description                       {Faker::Lorem.sentence}
        category_id                       { 2 }  
        status_id                         { 2 }
        shipping_charge_id                { 2 }
        shipping_area_id                  { 2 }
        shipping_day_id                   { 2 }
        cost                              { 500 }

        
  end
end
