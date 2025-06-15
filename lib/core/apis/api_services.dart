import 'package:dio/dio.dart';
import 'package:storeapp/core/apis/api_manager.dart';
import 'package:storeapp/core/resources/endpoints.dart';
import 'package:storeapp/models/products_model.dart';

class ApiServices {
  ApiManager apiManager;
  ApiServices({required this.apiManager});
  Future<ProductsModel> getAllProducts() async {
    try {
      var response = await apiManager.getData(AppEndpoints.getAllProducts);
      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      return productsModel;
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
}
