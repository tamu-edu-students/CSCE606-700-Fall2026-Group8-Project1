# frozen_string_literal: true

# Inventory item definition
class Item
  attr_accessor :name, :quantity, :threshold

  def initialize(name, threshold, quantity)
    @name = name
    @threshold = threshold
    @quantity = quantity
  end
end
