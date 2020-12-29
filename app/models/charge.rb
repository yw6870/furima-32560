class Charge < ApplicationRecord
  belongs_to :purchase_history

  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
  with_options presence: true, numericality: { other_than: 1, message: 'select' } do
    validates :prefecture_id
  end
end
