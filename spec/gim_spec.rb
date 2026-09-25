# frozen_string_literal: true

require "pstore"
require "tmpdir"

RSpec.describe Service do
  let(:tmp_file) { File.join(Dir.tmpdir, "test.pstore") }
  let(:db) { DB.new(tmp_file) }
  let(:service) { Service.new(db) }

  after do
    File.delete(tmp_file) if File.exist?(tmp_file)
  end

  describe "#update_item" do
    context "when the item exists" do
      before do
        initial_item = Item.new("Oranges", 5, 10)
        db.upsert_item(initial_item)
      end

      it "successfully updates item attributes in db" do
        expect { service.update_item("Oranges", 10, 15) }.not_to raise_error
        stored_item = db.get_item_by_name("Oranges")
        expect(stored_item.threshold).to eq(10)
        expect(stored_item.quantity).to eq(15)
      end
    end

    context "when the item does not exists" do
      it "raises an error and does not save a new item" do
        expect { service.update_item("Apples", 10, 15) }.to raise_error(RuntimeError)
        expect(db.get_item_by_name("Apples")).to be_nil
      end
    end
  end

  describe "#add_item" do
    context "when the item does not exist" do
      it "successfully adds a new item to db" do
        expect { service.add_item("Bananas", 5, 20) }.not_to raise_error
        stored_item = db.get_item_by_name("Bananas")
        expect(stored_item.name).to eq("Bananas")
        expect(stored_item.threshold).to eq(5)
        expect(stored_item.quantity).to eq(20)
      end
    end

    context "when the item already exists" do
      before do
        existing_item = Item.new("Grapes", 3, 8)
        db.upsert_item(existing_item)
      end

      it "raises an error and does not overwrite the existing item" do
        expect { service.add_item("Grapes", 10, 15) }.to raise_error(RuntimeError)
        stored_item = db.get_item_by_name("Grapes")
        expect(stored_item.threshold).to eq(3)
        expect(stored_item.quantity).to eq(8)
      end
    end

    context "when non numeric values are provided for threshold or quantity" do
      it "raises an error" do
        expect { service.add_item("Peaches", "five", 10) }.to raise_error(ArgumentError)
        expect { service.add_item("Peaches", 5, "ten") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#view_inventory" do
    it "returns all items in the inventory" do
      item1 = Item.new("Mangoes", 2, 5)
      item2 = Item.new("Pineapples", 4, 12)
      db.upsert_item(item1)
      db.upsert_item(item2)

      inventory = service.all_items
      expect(inventory.map(&:name)).to contain_exactly("Mangoes", "Pineapples")
    end
  end

  describe "#delete_item" do
    context "when the item does not exist" do
      it "raises an error" do
        expect(db.item_exists?("Oranges")).to eq(false)
        expect { service.delete_item("Oranges") }.to raise_error(RuntimeError)
      end
    end

    context "when the item does exist" do
      before do
        existing_item = Item.new("Oranges", 3, 8)
        db.upsert_item(existing_item)
      end

      it "successfully deletes the item" do
        expect(db.item_exists?("Oranges")).to eq(true)
        expect { service.delete_item("Oranges") }.not_to raise_error
        expect(db.item_exists?("Oranges")).to eq(false)
      end
    end
  end

  describe "#shortage_items" do
    it "returns items below their threshold" do
      item1 = Item.new("Strawberries", 5, 3) # Below threshold
      item2 = Item.new("Blueberries", 4, 6)  # Above threshold
      item3 = Item.new("Raspberries", 2, 1)  # Below threshold
      db.upsert_item(item1)
      db.upsert_item(item2)
      db.upsert_item(item3)

      shortage_items = service.shortage_items
      expect(shortage_items.map(&:name)).to contain_exactly("Strawberries", "Raspberries")
    end

    it "returns an empty array when no items are below their threshold" do
      item1 = Item.new("Cherries", 5, 6) # Above threshold
      item2 = Item.new("Plums", 4, 5) # Above threshold
      db.upsert_item(item1)
      db.upsert_item(item2)

      shortage_items = service.shortage_items
      expect(shortage_items).to be_empty
    end
  end
end
