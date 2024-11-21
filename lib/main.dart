// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart'; // Asegúrate de que esta es la única importación
import 'views/product_list.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(),
    );
  }
}
