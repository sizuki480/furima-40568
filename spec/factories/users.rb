FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password1' } # 確実に英数字混合を保証する
    password_confirmation { password }
    last_name             { '山田' } # 手動で全角文字を指定
    first_name            { '太郎' } # 手動で全角文字を指定
    last_name_kana        { 'ヤマダ' } # 手動で全角カナを指定
    first_name_kana       { 'タロウ' } # 手動で全角カナを指定
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
