require_relative "service"

class Cli
    def initialize(service)
        @service = service
    end

    def run
        loop do
            puts "Choose an option:"
            puts "1. Add item"
            puts "2. Get item by ID"
            puts "3. Get all items"
            puts "4. Clear all items"
            puts "5. Exit"
            choice = gets.chomp.to_i

            case choice
            when 1
                add_item
            when 2
                get_item_by_id
            when 3
                get_all_items
            when 4
                clear_all_items
            when 5
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
        print "Enter item ID: "
        id = gets.chomp
        print "Enter item quantity: "
        quantity = gets.chomp.to_i

        begin
            @service.add_item(name, threshold, id, quantity)
            puts "Item added successfully."
        rescue => e
            puts "Error adding item: #{e.message}"
        end
    end

    def get_item_by_id
        print "Enter item ID: "
        id = gets.chomp
        item = @service.get_item(id)
        if item
            puts "Item found: Name: #{item.name}, Threshold: #{item.threshold}, Quantity: #{item.quantity}, ID: #{item.id}"
        else
            puts "Item not found."
        end
    end
end