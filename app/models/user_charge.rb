class UserCharge
  attr_accessor :token, :price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  include ActiveModel::Model

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'input only number' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'select' }
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Charge.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end
