# Design
## System Architecture

**CLI**: User interface class through which the user interacts with the app. Responsible for printing information to the console and accepting user input.
Interacts with the service class to perform actions.

**Service**: Interface between the UI and DB connection. Responsible for checking for errors and business logic. Interacts with the CLI and DB classes, the CLI sends calls Service's functions when a user performs an input, and Service calls DB's functions to perform actions on the DB

**DB**: Connection to our Pstore. Responsible for maintaining the Pstore connection and performing actions directly on the Pstore. Interacts with the Service, the Service calls DB's functions when it needs to interact with the Pstore

**Item**: Represents our data in the Pstore. Responsible for defining what an item consists of and how it is constructed. Interacts with the Service and DB when a new item needs to be constructed or inserted.

## User Interface Design
Prints a list of options
```
Choose an option:
1. Add item
2. Update item
3. Delete item
4. Get item by name
5. View inventory
6. Clear all items
7. View shopping list (items below threshold)
8. Exit
```
Select an option by typing a number, prompts for other information needed
```
1
Enter item name: Oranges
Enter item threshold: 10
Enter item quantity: 20
Item added successfully.
```
After receiving successfully completing operation, reprints the option menu forever until exit command is send
```
5
Inventory:
Name: Oranges, Threshold: 10, Quantity: 20
Choose an option:
1. Add item
2. Update item
3. Delete item
...
```

## Design Decisions/Tradeoffs

Decided to use a three tier architecture to maintain clear separation of concerns between each part of our app, keeping our functions small and allowing for easy debugging and readability. 

Decided on a REPL user interface to allow for faster inputs as users would want to issue several commands in a row and also for better usability as some actions require several inputs (adding an item requires inputting item name, quantity and threshold)
