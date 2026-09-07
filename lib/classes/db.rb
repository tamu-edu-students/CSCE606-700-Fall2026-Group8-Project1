require 'pstore'
require_relative "item"

class DB
  def initialize(file_path)
    @store = PStore.new(file_path)
  end

  def add_item(item)
    if get_item(item.id)
      raise "Item with ID #{item.id} already exists."
    end
    @store.transaction do
      items = @store[:items] || []
      items << item
      @store[:items] = items
    end
  end

  def get_item(id)
    @store.transaction(true) do
      items = @store[:items] || []
      items.find { |item| item.id == id }
    end
  end

  def get_all_items
    @store.transaction(true) do
      @store[:items] || []
    end
  end

  def clear_items
    @store.transaction do
      @store[:items] = []
    end
  end
end