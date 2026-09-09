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
    puts "3. Get item by ID"
    puts "4. Get all items"
    puts "5. Clear all items"
    puts "6. Exit"
  end

  def run
    loop do
      print_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        add_item
      when 2
        update_item
      when 3
        get_item_by_id
      when 4
        get_all_items
      when 5
        clear_all_items
      when 6
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def add_item
    print "Enter item name: "
    name = gets.chomp
    print "Enter item threshold: "
    threshold = gets.chomp.to_i
    print "Enter item quantity: "
    quantity = gets.chomp.to_i

    begin
      @service.add_item(name, threshold, quantity)
      puts "Item added successfully."
    rescue StandardError => e
      puts "Error adding item: #{e.message}"
    end
  end

  def update_item
    print "Enter item name: "
    name = gets.chomp
    print "Enter item threshold: "
    threshold = gets.chomp.to_i
    print "Enter item quantity: "
    quantity = gets.chomp.to_i
    begin
      @service.update_item(name, threshold, quantity)
      puts "Item updated successfully."
    rescue StandardError => e
      puts "Error updating item: #{e.message}"
    end
  end

  def get_item_by_id
    print "Enter item ID: "
    id = gets.chomp.to_i
    item = @service.get_item(id)
    if item
      puts "Item found: Name: #{item.name}, Threshold: #{item.threshold}, Quantity: #{item.quantity}, ID: #{item.id}"
    else
      puts "Item not found."
    end
  end

  def get_all_items
    items = @service.get_all_items
    if items.empty?
      puts "No items found."
    else
      items.each do |item|
        puts "Name: #{item.name}, Threshold: #{item.threshold}, Quantity: #{item.quantity}, ID: #{item.id}"
      end
    end
  end

  def clear_all_items
    @service.clear_items
    puts "All items cleared."
  end
end
