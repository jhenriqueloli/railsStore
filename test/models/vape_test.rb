require "test_helper"

class VapeTest < ActiveSupport::TestCase
  
    def setup
      @vape = Vape.new(name: "Vape ABC", brand: "Brand ABC", warrancy: "12", price: "49.99", quantity: "30")
    end
  
    test "vape should be valid" do
      assert @vape.valid?
    end
  
    test "name should be present" do
      @vape.name = " "
      assert_not @vape.valid?
    end
  
    test "name should be unique" do
      @vape.save
      @vape2 = Vape.new(name: "Vape ABC")
      assert_not @vape2.valid?
    end
  
    test "brand should be present" do
      @vape.brand = " "
      assert_not @vape.valid?
    end

    test "warrancy should be present" do
      @vape.warrancy = " "
      assert_not @vape.valid?
    end

    test "warrancy should higher than or equal 1" do
      @vape.warrancy = 0
      assert_not @vape.valid?
    end

    test "price should be present" do
      @vape.price = " "
      assert_not @vape.valid?
    end

    test "price should higher than or equal 0" do
      @vape.price = -1
      assert_not @vape.valid?
    end

    test "quantity should higher than or equal 1" do
      @vape.quantity = 0
      assert_not @vape.valid?
    end

end
