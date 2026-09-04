class Item
  attr_accessor :name, :quantity, :threshold, :id

  def initialize(name, threshold, id, quantity)
    @name = name
    @threshold = threshold
    @id = id
    @quantity = quantity
  end
end