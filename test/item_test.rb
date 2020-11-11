require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class Test < Minitest::Test
  def test_it_exists_and_has_attributes
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_instance_of item1, Item

    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal "Tomato", item2.name
    assert_equal 0.5, item2.price
  end
end
