# Planning
Date of Planning Meeting- 9/4/26

We will build an app that will allow users to manage their grocery inventory by adding and removing items from their inventory, viewing their inventory, and easily viewing which items need to be restocked.

Required features:
- As a restaurant manager, I want to add an item, along with it's minimum restocking threshold, so that I can be alerted when my stock is low.
- As a restaurant manager, I want to update an item's quantity when I use an item or receive a delivery, so that I can keep track of my current stock.
- As a restaurant manager, I want to remove an item from the database if my restaurant is no longer using the item.
- As a restaurant manager, I want to generate a list of items below their minimum threshold, so that I can know what to purchase more of.
- As a restaurant manager, I want to see all items in my inventory, so that I can know what items I have already added to the system.
- As a restaurant manager, I want to receive an error when I attempt to add an item that already exists to the system, so that I can avoid creating duplicates.
- As a restaurant manager, I want to receive an error when I attempt to update an item that doesn't exist, so that I can know that my action did not have an effect.

Required features:
- Given an empty database, when I input an item "Oranges" with attributes like "count" and "minimum threshold", an entry with these attributes appears in our persistent storage.
- Given an item "Oranges" with a "count" of 3 in our persistent storage, when I submit a command to update the count by -2, "count" is set to 1 in our storage. 
- Given an item "Orange" in our persistent storage, when I submit a command to delete the item, it is no longer visible in storage.
- Given an item "Oranges" with a count of 3 and minimum threshold of 5, when I request a shopping list, "Oranges" appears in the output with a quantity of 2.
- Given several items and attributes exist in our storage, when I request the complete list of items, all of the items and their attributes appear in the output. 
- Given an item "Oranges" exists in our storage, when I try to add "Oranges" I receive an error "Oranges already exist". 
- Given no items exist in our storage, when I attempt to update "Oranges" count to 10, I receive an error "Oranges does not exist" 

Optional features:
- As a restaurant manager, I want to set an item's expiration date, so that I can be alerted when an item expires and dispose of it.
- As a restaurant manager, I want to set prices of items, so that I can get a shopping list price and budget.

Optional criteria:
- Given an item "Oranges" exists in our storage, when I update "Oranges" quantity with a count, and expiration date, both values are reflected in our storage.
- Given our storage has no items, when I add an item "Oranges", I can also set its price, and that price is displayed in the shopping list report.

Pair vs. Individual Programming:
- We used pair programming to set up our classes and database and individual programming for each of the user stories.

What does done mean?:
- All required features are fully implemented
