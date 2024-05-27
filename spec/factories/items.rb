FactoryBot.define do
  factory :item do
    association :user
    title                 { 'テストタイトル' }
    description           { 'テストの説明' }
    category_id           { '2' }
    condition_id          { '2' }
    shipping_cost_id      { '2' }
    prefecture_id         { '2' }
    shipping_date_id      { '2' }
    price                 { '1000' }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
