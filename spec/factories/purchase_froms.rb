FactoryBot.define do
  factory :purchase_from do
    
    user_id {Faker:: Number.non_zero_digit}
    item_id {Faker:: Number.non_zero_digit}
    post_code {Faker:: Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4)}
    area_id {Faker:: Number.between(from: 2, to: 48)}
    city {Faker:: Faker::Address.city}
    address {Faker:: Address.street_address}
    phone_number {Faker:: Faker::Number.leading_zero_number(digits: 11)}
    building {Faker:: Faker::Company.name}

  end
end