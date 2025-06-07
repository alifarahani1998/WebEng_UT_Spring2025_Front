import 'dart:convert';

import 'package:flutter_customer_seller_panel/api.dart';
import 'package:flutter_customer_seller_panel/product_model.dart';
import 'package:http/http.dart' as http;

class HTTPRequest {
  static Future<ProductModel> getProducts() async {
    // to simulate delayed response
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(Uri.parse(productsURL));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data from server');
    }
  }

  // Not implemented completely in server side
  static Future<String> addProducts(ProductModel product) async {
    var result = await http.post(
      Uri.parse(productsURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Use this to add token in API
        // 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(product.toJson()),
    );
    print(result.statusCode);
    return result.body;
  }
}
