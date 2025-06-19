import 'package:flutter/material.dart';
import 'package:storeapp/models/products_model.dart';

class ProductCard extends StatelessWidget {
  ProductsModel product;
  ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: 140,
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image!,
                width: 120,
                height: 85,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.title!,
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ ${product.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.favorite, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
