require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
   
    @order = Order.create(user_id: "1", status: "Open", amount: "0")
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { user_id: "1", status: "Open", amount: "20" } }
    assert_redirected_to root_path
  end

end
