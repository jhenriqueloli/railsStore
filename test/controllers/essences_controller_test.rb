require "test_helper"

class EssencesControllerTest < ActionDispatch::IntegrationTest
  
  include Devise::Test::IntegrationHelpers
  
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    
    @essence = Essence.create(name: "Vape Test", brand: "Brand Test", flavor: "blue berries", size: "20", strength: "soft", price: "10", quantity: "20")
  end

  test "should get new" do
    get new_essence_url
    assert_response :success
  end

  test "should create essence" do
    assert_difference 'Essence.count' do 
      post essences_url, params: { essence: { name: "Vape Test New", brand: "Brand Test New", flavor: "red berries", size: "21", strength: "medium", price: "15", quantity: "25" } }
    end

    assert_redirected_to products_path
  end

  test "should get edit" do
    get edit_essence_url(@essence)
    assert_response :success
  end

  test "should update essence" do
    patch essence_url(@essence), params: { essence: { name: "Essence Test Update", brand: "Brand Test Update", flavor: "red berries", size: "30", strength: "hard", price: "20", quantity: "30" } }
    assert_redirected_to products_path
  end


end
