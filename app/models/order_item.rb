class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :vape, foreign_key: 'code', primary_key: 'code'
  has_one :essence, foreign_key: 'code', primary_key: 'code'
  has_one :accessory, foreign_key: 'code', primary_key: 'code'
 

end