import 'package:flutter/material.dart';
import 'package:storeapp/core/apis/api_manager.dart';
import 'package:storeapp/core/apis/api_services.dart';
import 'package:storeapp/models/products_model.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_text_field.dart';

class UpdateProduct extends StatelessWidget {
  static const String routeName = "UpdateProduct";
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  UpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        ModalRoute.of(context)?.settings.arguments as ProductsModel;
    titleContoller.text = product.title!;
    descriptionController.text = product.description!;
    priceController.text = product.price.toString();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Update Product",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              CustomTextField(
                labelText: "Product Title",
                controller: titleContoller,
              ),
              SizedBox(height: 12),
              CustomTextField(
                labelText: "Product description",
                controller: descriptionController,
              ),
              SizedBox(height: 12),
              CustomTextField(
                labelText: "Product Price",
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              SizedBox(height: 12),
              CustomButton(
                onTap: () {
                  ApiServices(apiManager: ApiManager()).updateProduct(
                    product: ProductsModel(
                      id: product.id,
                      title: titleContoller.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),
                      image: product.image,
                      category: product.category,
                    ),
                    onLoading: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 2));
                          return Center(
                            child: AlertDialog(
                              title: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onSuccess: () {
                      ApiServices(apiManager: ApiManager()).getAllProducts();
                      Navigator.pop(context);
                    },
                    onFailure: (message) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Error",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            content: Text(
                              message,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
