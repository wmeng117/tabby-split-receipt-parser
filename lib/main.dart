import 'package:flutter/material.dart';
import 'models/receipt_item.dart';

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

  void _addItem() {
    setState(() {
      items.add(
        ReceiptItem(name: "Test", price: 1)
      );
    });
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