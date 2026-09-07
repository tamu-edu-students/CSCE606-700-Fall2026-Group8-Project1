require_relative "db"
require_relative "item"

class Service
    def initialize(db)
        @db = db
    end

    def add_item(name, threshold, id, quantity)
        item = Item.new(name, threshold, id, quantity)
        @db.add_item(item)
    end

    def get_item(id)
        @db.get_item(id)
    end
end