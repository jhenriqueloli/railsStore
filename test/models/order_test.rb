require "test_helper"

class OrderTest < ActiveSupport::TestCase
  
    def setup
      @order = Order.new(user_id: "1", status: "open", amount: "999.99")
    end
  
    test "order should be valid" do
      assert @order.valid?
    end
  
    test "user_id should be present" do
      @order.user_id = " "
      assert_not @order.valid?
    end
  
    test "amount should be higher or equal zero" do
      @order.amount = -1
      assert_not @order.valid?
    end
  
end
