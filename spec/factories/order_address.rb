FactoryBot.define do
  factory :order_address do
    token          { 'tok_abcdefghijk00000000000000000' }
    postal_code    { '123-4567' }
    prefecture_id  { Faker::Number.between(from: 2, to: 49) }
    city           { '横浜' }
    address        { '青山１−１' }
    building       { 'まーどれ' }
    phone_number   { '09012345678' }
  end
end
