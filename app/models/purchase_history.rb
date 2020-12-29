class PurchaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :charge
end
