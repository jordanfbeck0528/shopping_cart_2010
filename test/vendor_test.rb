require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    expected = {}

    assert_equal expected, vendor.inventory

    assert_equal 0, vendor.check_stock(item1)

    vendor.stock(item1, 30)
# require "pry"; binding.pry
    expected = {item1 => 30}

    assert_equal expected, vendor.inventory
    vendor.stock(item1, 25)

    # require "pry"; binding.pry
    assert_equal 55, vendor.check_stock(item1)

  end
end


# pry(main)> vendor.check_stock(item1)
# #=> 55
#
# pry(main)> vendor.stock(item2, 12)
#
# pry(main)> vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
