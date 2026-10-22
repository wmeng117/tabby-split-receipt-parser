import 'package:flutter/material.dart';
import 'package:test/models/Person.dart';
import 'models/ReceiptItem.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class ReceiptScreen extends StatefulWidget {
   const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();

}

class _ReceiptScreenState extends State<ReceiptScreen> {

  // Fake Receipt Items list for testing
  List<ReceiptItem> items = [];
  List<Person> people = [];

  TextEditingController itemNameInput = TextEditingController();
  TextEditingController itemPriceInput = TextEditingController();



  void _addItem() {
      double? actualPrice = double.tryParse(itemPriceInput.text); // Price from user input parsed as double within the button.
      if (actualPrice == null) {
      
      // Show an error message or handle invalid input
        print("Please enter a valid price");
        return;
      } else {
        setState(() {
          items.add(
            ReceiptItem(name: itemNameInput.text, price: actualPrice)
          );
        });
      }
  }

  void _addPerson() {
    final nameInput = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Person'),
          content: TextField(
            controller: nameInput,
            decoration: InputDecoration(
              labelText: 'Person name',
            ),
          ),
          actions: [
            
            
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
            
            
            TextButton(
              onPressed: () {
                final name = nameInput.text.trim();

                if (name.isEmpty) return;

                setState(() {
                  people.add(Person(name: name));
                });

                Navigator.pop(context);
                
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _assignItem() {
      setState(() {
        people.add(
          Person(name: "")  // Add logic to be able to name the people
        );
      });
  }

  void _choosePerson(ReceiptItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Who had ${item.name}?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: people.map((person) {
              return ListTile(
                title: Text(person.name),
                
                onTap: () {
                    setState(() {
                    person.assignedItems.add(item);
                    });

                  Navigator.pop(context);
                },
              
              );
            }).toList(),
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 135, 182),
      ),
      
      body: Column( 
        children: <Widget> [ 

          // Receipt Items live here on the screen
          Expanded( 
            child: ListView.builder( 
              itemCount: items.length, 
              itemBuilder: (context, index) {
                ReceiptItem curr = items[index];
                return ListTile(
                  title: Text(curr.name),
                  trailing: Text('\$${curr.price}'),
                  onTap: () {
                  _choosePerson(curr);
                  },
                );
              },
            ),
          ),


          // People live here on screen
          Expanded( 
            child: ListView.builder( 
              itemCount: people.length, 
              itemBuilder: (context, index) {
                Person curr = people[index];
                return ListTile(
                  title: Text(curr.name),
                  trailing: Text('\$${curr.calculateTotal()}'), // Double check later
                );
              },
            ),
          ),

          // Place to add item name 
          TextField(
            controller: itemNameInput,
            decoration: InputDecoration(
              labelText: 'Item name',
            ),
          ),


          // Place to add item price
          TextField(
            controller: itemPriceInput,
            decoration: InputDecoration(
              labelText: 'Price',
            ),
          ),
          
          Row(
            children: [

              // Button for adding Item
              ElevatedButton(
                onPressed: () {
                  _addItem();
                }, 
                child: Text('Add Item')
              ),
              

              // Button for adding person
              ElevatedButton(
                onPressed: () {
                  _addPerson();
                }, 
                child: Text('Add Person')
              ),
            ],
          ),

        ],
      
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ReceiptScreen()
    );
  }

}