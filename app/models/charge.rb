class Charge < ApplicationRecord
  belongs_to :purchase_history

  validates :price, presence: true
  validates :token, presence: true
end
