FactoryBot.define do
  factory :address do
    association :user, :item
    postal_code                   { 123-4567 }
    prefecture_id          { Faker::Number.between(from: 2, to: 49) }
    city                  { Faker::Address.city }
    address            { Faker::Address.secondary_address }
    phone_number        { '09012345678' }
    
  end
end
