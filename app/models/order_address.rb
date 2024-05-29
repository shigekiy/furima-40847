class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :street, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: 'must be selected' }
    validates :city
    validates :street
    validates :phone_number, numericality: { only_integer: true, message: 'must be an integer' },
                             length: { minimum: 10, maximum: 11, message: 'must be 10 or 11 digits' }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    # 注文情報を保存し、変数orderに代入する
    order = Order.create(item_id:, user_id:)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(zip_code:, prefecture_id:, city:, street:, building:,
                   phone_number:, order_id: order.id)
  end
end
