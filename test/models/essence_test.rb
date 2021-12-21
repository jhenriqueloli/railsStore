require "test_helper"

class EssenceTest < ActiveSupport::TestCase

  def setup
    @essence = Essence.new(name: "Essence ABC", brand: "Brand ABC", price: "49.99", quantity: "30", flavor: "green apple" , strength: "soft" , size: "20")
  end

  test "essence should be valid" do
    assert @essence.valid?
  end

  test "name should be present" do
    @essence.name = " "
    assert_not @essence.valid?
  end

  test "name should be unique" do
    @essence.save
    @essence2 = Essence.new(name: "Essence ABC")
    assert_not @essence2.valid?
  end

  test "brand should be present" do
    @essence.brand = " "
    assert_not @essence.valid?
  end

  test "price should be present" do
    @essence.price = " "
    assert_not @essence.valid?
  end

  test "price should higher than or equal 0" do
    @essence.price = -1
    assert_not @essence.valid?
  end

  test "quantity should be present" do
    @essence.quantity = " "
    assert_not @essence.valid?
  end

  test "quantity should higher than or equal 1" do
    @essence.quantity = 0
    assert_not @essence.valid?
  end

  test "flavor should be present" do
    @essence.flavor = " "
    assert_not @essence.valid?
  end

  test "strength should be soft, medium or hard" do
    @essence.strength = "soft"
    assert @essence.valid?
  end

  test "size should be present" do
    @essence.size = " "
    assert_not @essence.valid?
  end

  test "size should higher than 0" do
    @essence.size = -1
    assert_not @essence.valid?
  end
end
