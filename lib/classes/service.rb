# frozen_string_literal: true

require_relative "db"
require_relative "item"

# Connection between UI and DB, business logic
class Service
  def initialize(db)
    @db = db
  end

  def add_item(name, threshold, quantity)
    raise "Item with name #{name} already exists." if @db.item_exists?(name)
    if !threshold.is_a?(Integer) || !quantity.is_a?(Integer)
      raise ArgumentError, "Threshold and quantity must be integers."
    end

    item = Item.new(name, threshold, quantity)
    @db.upsert_item(item)
  end

  def update_item(name, threshold, quantity)
    raise "Item with name #{name} does not exist" unless @db.item_exists?(name)

    item = Item.new(name, threshold, quantity)
    @db.upsert_item(item)
  end

  def delete_item(name)
    raise "Item with name #{name} does not exist" unless @db.item_exists?(name)

    @db.delete_item(name)
  end

  def get_item_by_name(name)
    @db.get_item_by_name(name)
  end

  def all_items
    @db.all_items
  end

  def clear_items
    @db.clear_items
  end

  def shortage_items
    @db.shortage_items
  end
end
