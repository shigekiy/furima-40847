FactoryBot.define do
  factory :user do
    nickname              { 'テストニックネーム' }
    email                 { Faker::Internet.email }
    password              { 'test1234' }
    password_confirmation { password }
    last_name             { '太郎' }
    first_name            { '山田' }
    last_name_kana        { 'タロウ' }
    first_name_kana       { 'ヤマダ' }
    birthday              { '2000-01-01' }
  end
end
