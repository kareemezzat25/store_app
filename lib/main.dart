import 'package:flutter/material.dart';
import 'package:storeapp/views/home.dart';
import 'package:storeapp/views/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.routeName: (context) => HomeView(),
        UpdateProduct.routeName: (context) => UpdateProduct(),
      },
      initialRoute: HomeView.routeName,
    );
  }
}
