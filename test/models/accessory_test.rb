require "test_helper"
# :name, :brand, :price, :quantity
class AccessoryTest < ActiveSupport::TestCase
  
    def setup
      @accessory = Accessory.new(name: "Accessory ABC", brand: "Brand ABC", price: "49.99", quantity: "30")
    end
  
    test "accessory should be valid" do
      assert @accessory.valid?
    end
  
    test "name should be present" do
      @accessory.name = " "
      assert_not @accessory.valid?
    end
  
    test "name should be unique" do
      @accessory.save
      @accessory2 = Accessory.new(name: "Accessory ABC")
      assert_not @accessory2.valid?
    end
  
    test "brand should be present" do
      @accessory.brand = " "
      assert_not @accessory.valid?
    end

    test "price should be present" do
      @accessory.price = " "
      assert_not @accessory.valid?
    end

    test "price should higher than or equal 0" do
      @accessory.price = -1
      assert_not @accessory.valid?
    end

    test "quantity should be present" do
      @accessory.quantity = " "
      assert_not @accessory.valid?
    end

    test "quantity should higher than or equal 1" do
      @accessory.quantity = 0
      assert_not @accessory.valid?
    end

end

