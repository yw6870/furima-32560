FactoryBot.define do
  factory :item do
    name {Faker::JapaneseMedia::Doraemon.gadget}
    info{Faker::Movies::HarryPotter.quote}
    category_id {Faker::Number.within(range: 2..11)}
    sales_status_id {Faker::Number.within(range: 2..7)}
    shipping_fee_status_id {Faker::Number.within(range: 2..3)}
    prefecture_id {Faker::Number.within(range: 2..48)}
    scheduled_delivery_id {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user 
  end
end
