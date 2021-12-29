require "test_helper"

class VapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vape = Vape.create(name: "Vape Test", brand: "Brand Test", warrancy: "2", price: "10", quantity: "20")
  end

  test "should get new" do
    get new_vape_url
    assert_response :success
  end

  test "should create vape" do
    assert_difference('Vape.count') do
      post vapes_url, params: { vape: { name: "Vape Test", brand: "Brand Test", warrancy: "2", price: "10", quantity: "20" } }
    end

    assert_redirected_to products_path
  end

  test "should get edit" do
    get edit_vape_url(@vape)
    assert_response :success
  end

  test "should update vape" do
    patch vape_url(@vape), params: { vape: { name: "Vape Test Update", brand: "Brand Test Update", warrancy: "3", price: "30", quantity: "30" } }
    assert_redirected_to products_path
  end

end
