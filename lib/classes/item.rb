# frozen_string_literal: true

# Inventory item definition
class Item
  attr_accessor :name, :quantity, :threshold, :id

  def initialize(name, threshold, quantity)
    @name = name
    @threshold = threshold
    @quantity = quantity
  end
end
