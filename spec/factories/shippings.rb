FactoryBot.define do
  factory :shipping do
    post_code { "MyString" }
    shipping_area_id { 1 }
    city { "MyString" }
    address { "MyString" }
    building { "MyString" }
    tel { "MyString" }
    buy { nil }
  end
end
