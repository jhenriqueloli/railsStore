require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = Order.create(user_id: "1", status: "Open", amount: "0")
  end

  test "should get root_page" do
    get root_page
    assert_response :success
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: {  } }
    assert_redirected_to order_url(@order)
  end

end
