FactoryBot.define do
  factory :user do
    nickname                           {Faker::Name.initials(number: 2)}
    email                              {Faker::Internet.free_email}
    password                           {Faker::Lorem.characters(number: 6)}
    password_confirmation {password}   
    family_name                        {"山田"}
    last_name                          {"太朗"}
    family_name_kana                   {"ヤマダ"}
    last_name_kana                     {"タロウ"}
    birthday                           {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end