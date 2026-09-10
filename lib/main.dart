import 'package:flutter/material.dart';
import 'models/receipt_item.dart';

void main() {
  runApp(const MyApp());
}

class ReceiptScreen extends StatefulWidget {
   ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();

}

class _ReceiptScreenState extends State<ReceiptScreen> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 190, 43, 190)
        ),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReceiptScreen()
    );
  }

}