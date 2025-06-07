import 'package:flutter/material.dart';
import 'package:flutter_customer_seller_panel/http_request.dart';
import 'package:flutter_customer_seller_panel/product_model.dart';
import 'package:flutter_customer_seller_panel/textfield_widget.dart';

class ProductPage extends StatelessWidget {
  ProductModel productModel = new ProductModel();

  TextEditingController nameController = new TextEditingController();

  TextEditingController brandController = new TextEditingController();

  TextEditingController categoryController = new TextEditingController();

  Future<ProductModel> getProduct() async {
    productModel = await HTTPRequest.getProducts();
    return productModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProduct(),
      builder: (context, snapshot) {
        final product = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('مدیریت محصولات'),
            backgroundColor: Colors.lightBlue,
            actionsPadding: EdgeInsets.all(10),
            actions: [
              InkWell(
                onTap:
                    () => showDialog(
                      context: context,
                      builder:
                          (context) => Dialog(
                            child: Container(
                              padding: EdgeInsets.all(50),
                              width: 300,
                              child: Column(
                                spacing: 20,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextfieldWidget(
                                    controller: nameController,
                                    textHint: 'Enter name',
                                  ),
                                  TextfieldWidget(
                                    controller: brandController,
                                    textHint: 'Enter brand',
                                  ),
                                  TextfieldWidget(
                                    controller: categoryController,
                                    textHint: 'Enter category',
                                  ),
                                  ElevatedButton(
                                    onPressed:
                                        () => HTTPRequest.addProducts(
                                          ProductModel(
                                            data: [
                                              Data(
                                                name: nameController.text,
                                                brand: brandController.text,
                                                category:
                                                    categoryController.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                    child: Text('Add product'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                child: Row(children: [Text('افزودن محصول'), Icon(Icons.add)]),
              ),
            ],
          ),
          body:
              !snapshot.hasData
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: productModel.data!.length,
                      itemBuilder:
                          (context, index) => Container(
                            margin: EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Name: ' + product!.data![index].name!),
                                Text(
                                  'Category: ' + product.data![index].category!,
                                ),
                                Text('Brand: ' + product.data![index].brand!),
                                Text('Color: ' + product.data![index].color!),
                                InkWell(
                                  onTap: () {
                                    print('tapped');
                                  },
                                  child: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
        );
      },
    );
  }
}
