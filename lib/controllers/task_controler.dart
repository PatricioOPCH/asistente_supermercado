import '../models/task.dart';

import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductController extends ChangeNotifier {
  final List<Product> _products = [
    Product(name: 'Detergente', price: 2.00, quantity: 3),
    Product(name: '100ml', price: 1.50, quantity: 2),
  ];

  List<Product> get products => _products;

  // Function to update quantity
  void updateQuantity(int index, int newQuantity) {
    _products[index].quantity = newQuantity;
    notifyListeners(); // Notify listeners for UI update
  }

  // Calculate the total price
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var product in _products) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }
}