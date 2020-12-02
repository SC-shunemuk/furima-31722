FactoryBot.define do
  factory :purchase_form do
    address_code             { '122-0032' }
    city                     { '横浜市緑区' }
    address_number           { '青山1-1-1' }
    house_name               { '青山ビル1F' }
    tel                      { Faker::Number.number(digits: 10) }
    prefecture_id            { 2 }
    token                    { 'tok_abcdefghijk00000000000000000' }
    user_id                  { 1 }
    item_id                  { 1 }
  end
end
