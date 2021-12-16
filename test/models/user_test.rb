require "test_helper"

class UserTest < ActiveSupport::TestCase
  
    def setup
      @user = User.new(username: "Senhor Madruga", email: "madruga@gmail.com", password: "321654")
    end
  
    test "user should be valid" do
      assert @user.valid?
    end
  
    test "name should be present" do
      @user.name = " "
      assert_not @user.valid?
    end

    test "name should not be too long" do
      @user.name = "a" * 31
      assert_not @user.valid?
    end
  
    test "name should not be too short" do
      @user.name = "aa"
      assert_not @user.valid?
    end

    test "email should be present" do
      @user.email = " "
      assert_not @user.valid?
    end

    test "email should be unique" do
      @user.save
      @user2 = Vape.new(username: "Senhor Barriga", email: "madruga@gmail.com", password: "321654")
      assert_not @user2.valid?
    end

    
  
end
