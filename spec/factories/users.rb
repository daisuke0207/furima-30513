FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.free_email }
    password { 'abc456' }
    password_confirmation { password }
    first_name { 'あ' }
    last_name { '色' }
    first_name_kana { 'ア' }
    last_name_kana  { 'イロ' }
    birthday { Faker::Date.birthday }
  end
end
