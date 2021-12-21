class Vape < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :brand, presence: true
  validates :warrancy, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
   
  validates_uniqueness_of :name

  belongs_to :order_item, foreign_key: 'code', primary_key: 'code', optional: true
  
end

