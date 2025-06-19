import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:storeapp/core/apis/api_manager.dart';
import 'package:storeapp/core/resources/endpoints.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/models/products_model.dart';

class ApiServices {
  ApiManager apiManager;
  ApiServices({required this.apiManager});
  Future<List<ProductsModel>> getAllProducts() async {
    try {
      var response = await apiManager.getData(AppEndpoints.getAllProducts);
      List<dynamic> dataList = response.data;

      List<ProductsModel> products = dataList.map((item) {
        return ProductsModel.fromJson(item);
      }).toList();
      log("Products length: ${products.length}");
      return products;
    } catch (e) {
      throw Exception("Some Thing went Wrong when i fetch of all products");
    }
  }

  Future<List<String>> getAllCategories() async {
    try {
      Response<dynamic> result = await apiManager.getData(
        AppEndpoints.getAllCategories,
      );
      return result.data;
    } catch (e) {
      throw Exception("Some Thing Went Wrong when i fetch data of categories");
    }
  }

  Future<ProductsModel> getProductsByCategory(String categoryName) async {
    try {
      var result = await apiManager.getData(
        AppEndpoints.getProductsWithCategory(categoryName),
      );
      ProductsModel productsModel = ProductsModel.fromJson(result.data);
      return productsModel;
    } catch (e) {
      throw Exception(
        "Some Thing Went Wrong when i fetch products with CategoryName",
      );
    }
  }

  Future<void> addProduct({required ProductModel product}) async {
    try {
      await apiManager.postData(
        AppEndpoints.addProduct,
        {
          "title": product.title,
          "price": product.price,
          "description": product.description,
          "image": product.image,
          "category": product.category,
        },
        headers: {"Content-Type": "text/plain"},
      );
    } catch (e) {
      throw Exception("Some Thing Went Wrong When add Product");
    }
  }

  Future<void> updateProduct({
    required ProductsModel product,
    required Function() onLoading,
    required Function() onSuccess,
    required Function(String message) onFailure,
  }) async {
    try {
      onLoading();
      await apiManager.putData(AppEndpoints.updateProduct(product.id!), {
        "title": product.title,
        "description": product.description,
        "price": product.price,
        "image": product.image,
        "category": product.category,
      });
      onSuccess();
    } catch (e) {
      onFailure("SomeThing when Update data");
      throw Exception("SomeThing Went Wrong when Update the data of product");
    }
  }
}
