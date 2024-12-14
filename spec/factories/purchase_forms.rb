FactoryBot.define do
  factory :purchase_form do
    user_id { 1 } 
    item_id { 1 }
    post_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    area_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    phone_number { Faker::Number.number(digits: 10) }
    building { Faker::Address.secondary_address }
    token {"tok_abcdefghijk00000000000000000"}
  end
end