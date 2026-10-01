import 'package:flutter/material.dart';
import 'models/receipt_item.dart';
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
  List<ReceiptItem> items = [
    ReceiptItem(name: 'Burger', price: 5), 
    ReceiptItem(name: 'Fries', price: 3), 
    ReceiptItem(name: 'Drink', price: 1)
  ];

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 135, 182),
      ),
      
      body: Column( 
        children: <Widget> [ 
          Expanded( 
            child: ListView.builder( 
              itemCount: items.length, 
              itemBuilder: (context, index) {
                ReceiptItem curr = items[index];
                return ListTile(
                  title: Text(curr.name),
                  trailing: Text('\$${curr.price}'),
                );
              },
            ),
          ),

          
          TextField(
            controller: itemNameInput,
            decoration: InputDecoration(
              labelText: 'Item name',
            ),
          ),

          TextField(
            controller: itemPriceInput,
            decoration: InputDecoration(
              labelText: 'Price',
            ),
          ),
          
          ElevatedButton(
            onPressed: () {
              _addItem();
            }, 
            child: Text('Add Item')
          )

        
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