class Accessory < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :brand, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
   
  validates_uniqueness_of :name

  belongs_to :order_item, foreign_key: 'code', primary_key: 'code', optional: true
end
