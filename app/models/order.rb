class Order < ApplicationRecord

  has_many :order_items
  before_save :set_subtotal

  validates :status , presence:  true
  belongs_to :user

  def subtotal
    order_items.collect { |order_item| order_item.valid? ? order_item.price * order_item.quantity : 0 }.sum
  end

  public

  def set_subtotal
    self[:amount] = subtotal
  end

end
