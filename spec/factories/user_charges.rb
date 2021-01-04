FactoryBot.define do
  factory :user_charge do
    user_id {1}
    item_id {1}
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'テスト' }
    addresses { 'テスト' }
    building {'テスト'}
    phone_number { 12345678987 }
  end
end
