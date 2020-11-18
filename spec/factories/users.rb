FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    first_name            { '宏' }
    last_name             { '山田' }
    first_name_kana       { 'ヒロシ' }
    last_name_kana        { 'ヤマダ' }
    birth_date            { Faker::Date.in_date_period }
  end
end
