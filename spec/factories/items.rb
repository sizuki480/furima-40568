FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explanation { Faker::Lorem.paragraph }
    category_id { rand(2..11) }
    situation_id { rand(2..7) }
    shipping_pay_id { rand(2..3) }
    shipping_area_id { rand(2..48) }
    shipping_time_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

# FactoryBot.define do
#   factory :item do
#     name { Faker::Name.name }
#     explanation { Faker::Lorem.paragraph }
#     category_id { rand(2..11) }
#     situation_id { rand(2..7) }
#     shipping_pay_id { rand(2..3) }
#     shipping_area_id { rand(2..48) }
#     shipping_time_id { rand(2..4) }
#     price { rand(300..9_999_999) }

#     after(:build) do |item|
#       message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
#     end
#   end
# end

# | name             | string     | null: false |
# | explanation      | text       | null: false |
# | category_id      | integer    | null: false |
# | situation_id     | integer    | null: false |
# | shipping_pay_id  | integer    | null: false |
# | shipping_area_id | integer    | null: false |
# | shipping_time_id | integer    | null: false |
# | price            | integer    | null: false |
# | user             | references | null: false, foreign_key: true |
