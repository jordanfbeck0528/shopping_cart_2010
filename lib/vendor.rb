class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item_number)
    if @inventory.include?(item_number)
      inventory_array = []
      @inventory.each do |name, price|
        inventory_array << name
      end
      inventory_array.count
    else
       0
    end
  end

  def stock(item_number, quantity)
    quantity.times do |stock_item|
      @inventory[item_number] += 1
    end
  end
end
