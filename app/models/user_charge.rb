class UserCharge
  attr_accessor :token

  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :card_number, numericality: { with: /\A[0-9]+\z/, message: "can't be blank" }
    validates :card_exp_month, numericality: { with: /\A[0-9]+\z/, message: "can't be blank" }
    validates :card_cvc, numericality: { with: /\A[0-9]+\z/, message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "input correctly" }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'input full-width characters' }
    validates :addresses, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "input full-width characters" }
    validates :phone_number, format: { with: /\A[0-9]{9}\z/, message: "input only number" }
  end
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'select' }

  def save
    # トークンの内容
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Charge.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end