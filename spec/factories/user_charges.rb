FactoryBot.define do
  factory :user_charge do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'テスト' }
    addresses { 'テスト' }
    phone_number { 12345678987 }
  end
end
