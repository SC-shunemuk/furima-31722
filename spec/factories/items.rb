FactoryBot.define do
  factory :item do
    image               { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/flag.png')) }
    name                { Faker::Name.initials(number: 2) }
    content             { Faker::Lorem.sentence }
    price               { 450 }
    category_id         { 2 }
    status_id           { 2 }
    bear_price_id       { 2 }
    shipping_address_id { 2 }
    shipping_day_id     { 2 }
    association :user
  end
end
