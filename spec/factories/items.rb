FactoryBot.define do
  factory :item do
    id { Faker::Number.between(from: 1, to: 100)}
    name { 'test' }
    description { 'sample' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
