FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { 'あ' }
    block { 'あ' }
    building { 'あ' }
    phone { '00011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
