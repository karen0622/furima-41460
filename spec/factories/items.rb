FactoryBot.define do
  factory :item do
    association :user

    name { Faker::Name.name }
    explanation{Faker::Lorem.paragraph}
    category_id{ Faker::Number.between(from: 1, to: 10) }
    product_condition_id{Faker::Number.between(from: 1, to: 5)}
    shipping_cost_id{Faker::Number.between(from: 1, to: 2)}
    shipping_date_id{Faker::Number.between(from: 1, to: 3)}
    area_id{Faker::Number.between(from: 1, to: 47)}
    price{Faker::Number.between(from: 300, to: 9_999_999)}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end