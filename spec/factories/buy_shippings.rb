FactoryBot.define do
  factory :buy_shipping do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address { '豊島区1-2' }
    building { '東京ハイツ' }
    tel { '12345678901' }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
  end
end
