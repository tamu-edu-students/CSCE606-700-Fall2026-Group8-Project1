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

    item = Item.new(name, threshold, quantity)
    @db.upsert_item(item)
  end

  def update_item(name, threshold, quantity)
    raise "Item with name #{name} does not exist" unless @db.item_exists?(name)

    item = Item.new(name, threshold, quantity)
    @db.upsert_item(item)
  end

  def get_item_by_name(name)
    @db.get_item_by_name(name)
  end

  # broken
  def get_all_items
    @db.get_all_items
  end

  # broken
  def clear_items
    @db.clear_items
  end
end
