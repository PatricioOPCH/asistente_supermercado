// lib/views/product_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    
    // Calcula el total a pagar
    double totalPrice = productController.calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          // Recuadro superior con mensaje
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.amber[100],
            child: Text(
              'Use la caja para adquirir el producto',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),

          // Barra de búsqueda y botón de cámara
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar producto...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Acción para el botón de cámara
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // Lista de productos
          Expanded(
            child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                final product = productController.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price} - Quantity: ${product.quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      productController.updateQuantity(index, product.quantity + 1);
                    },
                  ),
                );
              },
            ),
          ),

          // Rectángulo con el total a pagar
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'El total a pagar es \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          // Botones circulares
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                child: Text('Aceptar', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20), // Espaciado entre botones
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20), // Espaciado entre botones
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue,
                child: Text('Revisar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 20), // Espaciado inferior
        ],
      ),
    );
  }
}

