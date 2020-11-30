FactoryBot.define do
  factory :purchase_form do
    address_code             {"122-0032"}
    city                     {"横浜市緑区"}
    address_number           {"青山1-1-1"}
    house_name               {"青山ビル1F"}
    tel                      {Faker::Number.number(digits: 10)}
    prefecture               {2}
  end
end
