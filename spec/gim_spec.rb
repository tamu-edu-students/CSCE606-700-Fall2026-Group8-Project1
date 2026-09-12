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
  end
end
