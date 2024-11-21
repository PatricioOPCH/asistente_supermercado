import 'package:flutter/material.dart';
import '../controllers/task_controler.dart';



class MarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Market'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Search bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.camera_alt),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              // Products List
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Product ${index + 1}'),
                      subtitle: Text('Description'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('\$4.00'),
                          SizedBox(height: 4),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Cart Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('View Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}