FactoryBot.define do
  factory :order_address do
    zip_code { '123-4567' }
    prefecture_id { 14 }
    city { '杉並区' }
    street { '桃井 1-1' }
    building { '杉並ハイツ' }
    phone_number { '09011112222' }
    token { '123456' }
  end
end
