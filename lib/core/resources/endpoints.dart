class AppEndpoints {
  static const String getAllProducts = "https://fakestoreapi.com/products";
  static const String getAllCategories =
      "https://fakestoreapi.com/products/categories";

  static String getProductsWithCategory(String categoryName) {
    return "https://fakestoreapi.com/products/category/$categoryName";
  }

  static const String addProduct = "https://fakestoreapi.com/products";

  static String updateProduct(String id) {
    return "https://fakestoreapi.com/products/$id";
  }
}
