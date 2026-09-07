#!/usr/bin/env ruby
# frozen_string_literal: true
require_relative "classes/db"
require_relative "classes/service"
require_relative "classes/cli"

def main
  db = DB.new("items.pstore")
  service = Service.new(db)
  service.add_item("Another Item", 20, 2, 15)
  retrieved_item = service.get_item(2)
  puts "Retrieved item from service: #{retrieved_item.name}, Quantity: #{retrieved_item.quantity}, Threshold: #{retrieved_item.threshold}, ID: #{retrieved_item.id}"
  cli = Cli.new(service)
end

main if __FILE__ == $PROGRAM_NAME
