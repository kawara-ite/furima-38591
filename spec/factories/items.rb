FactoryBot.define do
  factory :item do
    association :user
    name                   { Faker::Name.name }
    info                   { Faker::Lorem.sentence(word_count: 5) }
    price                  { Faker::Number.between(from: 300, to: 10_000_000) }
    category_id            { Faker::Number.between(from: 2, to: 12) }
    sales_status_id        { Faker::Number.between(from: 2, to: 8) }
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 4) }
    prefecture_id          { Faker::Number.between(from: 2, to: 49) }
    scheduled_delivery_id  { Faker::Number.between(from: 2, to: 5) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end
