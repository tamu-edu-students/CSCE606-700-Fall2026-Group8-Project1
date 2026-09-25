# Grocery Inventory Manager

## Description
This app will allow users to manage their grocery inventory by adding and removing items from their inventory, viewing their inventory, and easily viewing which items need to be restocked.

## Installation instructions

Run `./bin/setup` to install dependencies

## How to Run

Run `chmod +x ./lib/gim.rb` to allow execution.

Run `./lib/gim.rb` to run app.

## Testing Instructions

Run `rake spec` to run the tests.

## Main Features

- Add items to inventory (item name, quantity, minimum quantity threshold)
- Delete items from inventory
- Update items in inventory
- See items (by name, all items, items below threshold)

## Known Limitations

- Unable to set item expiration 
- Items must be inserted and updated one at a time
- Updating item requires inputting quantity and threshold, cannot update just quantity or just threshold on their own

## Team Members
Colin Bakker

Zachary Williams