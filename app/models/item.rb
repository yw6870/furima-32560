class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sales_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee_status

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :scheduled_delivery

  validates :image,                  presence: true
  validates :name,                   presence: true
  validates :info,                   presence: true
  validates :category_id,            presence: true, numericality: { other_than: 1 } 
  validates :sales_status_id,        presence: true, numericality: { other_than: 1 } 
  validates :shipping_fee_status_id, presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id,          presence: true, numericality: { other_than: 1 } 
  validates :scheduled_delivery_id,  presence: true, numericality: { other_than: 1 } 
  validates :price,                  presence: true
end
