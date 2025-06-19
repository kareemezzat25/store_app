import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storeapp/core/apis/api_manager.dart';
import 'package:storeapp/core/apis/api_services.dart';
import 'package:storeapp/models/products_model.dart';
import 'package:storeapp/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "Home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "New Trend",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductsModel>>(
        future: ApiServices(apiManager: ApiManager()).getAllProducts(),
        builder: (state, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blue));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ApiServices(apiManager: ApiManager()).getAllProducts(),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ProductCard(product: snapshot.data![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
