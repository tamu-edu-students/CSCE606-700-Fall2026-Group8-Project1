# frozen_string_literal: true

require "pstore"
require_relative "item"

# Manages connection to PStore
class DB
  def initialize(file_path)
    @store = PStore.new(file_path)
  end

  def upsert_item(item)
    @store.transaction do
      @store[:item.name] = item
    end
  end

  def item_exists?(item_name)
    @store.transaction do
      @store.root?(item_name)
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