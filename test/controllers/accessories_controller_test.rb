require "test_helper"

class AccessoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accessory = Accessory.create(name: "Accessory Test", brand: "Brand Test", price: "10", quantity: "20")
  end

  test "should get new" do
    get new_accessory_url
    assert_response :success
  end

  test "should create accessory" do
    assert_difference('Accessory.count') do
      post accessories_url, params: { accessory: { name: "Accessory Test", brand: "Brand Test", price: "10", quantity: "20" } }
    end

    assert_redirected_to products_path
  end

  test "should get edit" do
    get edit_accessory_url(@accessory)
    assert_response :success
  end

  test "should update accessory" do
    patch accessory_url(@accessory), params: { accessory: { name: "Accessory Test Update ", brand: "Brand Test Update",  price: "20", quantity: "30" } }
    assert_redirected_to products_path
  end

end
