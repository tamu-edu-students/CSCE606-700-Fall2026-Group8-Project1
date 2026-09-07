#!/usr/bin/env ruby
# frozen_string_literal: true
require_relative "classes/db"
require_relative "classes/service"
require_relative "classes/cli"

def main
  db = DB.new("items.pstore")
  item = Item.new("Sample Item", 10, 1, 5)
  db.add_item(item)
  db_item = db.get_item(1)
  puts "Retrieved item: #{db_item.name}, Quantity: #{db_item.quantity}, Threshold: #{db_item.threshold}, ID: #{db_item.id}"
  service = Service.new(db)
  cli = Cli.new(service)
end

main if __FILE__ == $PROGRAM_NAME
