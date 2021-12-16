class Essence < ApplicationRecord
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :brand, presence: true
  validates :price, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :flavor, presence: true
  validates :size, presence: true,numericality: { only_integer: true }
    
  validates_uniqueness_of :name
  enum strength: { soft: 0, medium: 1, hard: 2 }

  belongs_to :order_item , foreign_key: 'code', primary_key: 'code', optional: true
end
