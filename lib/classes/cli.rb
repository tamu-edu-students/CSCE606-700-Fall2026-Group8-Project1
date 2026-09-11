# frozen_string_literal: true

require_relative "service"

# User interface
class Cli
  def initialize(service)
    @service = service
  end

  def print_menu
    puts "Choose an option:"
    puts "1. Add item"
    puts "2. Update item"
    puts "3. Get item by name"
    puts "4. View inventory"
    puts "5. Clear all items"
    puts "6. Exit"
  end

  def run
    loop do
      print_menu
      choice = gets.chomp.to_i

      case choice
      when 1 then add_item
      when 2 then update_item
      when 3 then item_by_name
      when 4 then get_all_items
      when 5 then clear_all_items
      when 6 then break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def upsert_input
    print "Enter item name: "
    name = gets.chomp
    print "Enter item threshold: "
    threshold = gets.chomp.to_i
    print "Enter item quantity: "
    quantity = gets.chomp.to_i
    [name, threshold, quantity]
  end

  def add_item
    name, threshold, quantity = upsert_input
    begin
      @service.add_item(name, threshold, quantity)
      puts "Item added successfully."
    rescue StandardError => e
      puts "Error adding item: #{e.message}"
    end
  end

  def update_item
    name, threshold, quantity = upsert_input
    begin
      @service.update_item(name, threshold, quantity)
      puts "Item updated successfully."
    rescue StandardError => e
      puts "Error updating item: #{e.message}"
    end
  end

  def item_by_name
    print "Enter item name: "
    name = gets.chomp
    item = @service.get_item_by_name(name)
    if item
      puts "Item found: Name: #{item.name}, Threshold: #{item.threshold}, Quantity: #{item.quantity}"
    else
      puts "Item not found."
    end
  end

  # broken
  def get_all_items
    items = @service.get_all_items
    if items.empty?
      puts "No items found."
    else
      puts "Inventory:"
      items.each do |item|
        puts "Name: #{item.name}, Threshold: #{item.threshold}, Quantity: #{item.quantity}"
      end
    end
  end

  # broken
  def clear_all_items
    @service.clear_items
    puts "All items cleared."
  end
end
