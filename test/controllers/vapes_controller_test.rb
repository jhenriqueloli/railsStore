require "test_helper"

class VapesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
   
    @vape = Vape.create(name: "Vape Test", brand: "Brand Test", warrancy: "2", price: "10", quantity: "20")
  end

  test "should get new" do
    get new_vape_url
    assert_response :success
  end

  test "should create vape" do
    assert_difference 'Vape.count' do 
      post vapes_url, params: {  name: "Vape Test New", brand: "Brand Test New", warrancy: "3", price: "13", quantity: "23" }
    end

    assert_redirected_to products_path
  end

  test "should get edit" do
    get edit_vape_url(@vape)
    assert_response :success
  end

  test "should update vape" do
    patch vape_url(@vape), params: { name: "Vape Test Update", brand: "Brand Test Update", warrancy: "3", price: "30", quantity: "30"  }
    assert_redirected_to products_path
  end

end
