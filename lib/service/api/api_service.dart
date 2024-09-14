import 'dart:convert';

import 'package:dummycommerce/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'https://fakestoreapi.com/products';

  // GET ALL CATEGORIES

  Future<List<String>> getAllCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;

      //converting the json body to list of categories of string type
      final List<String> categories =
          body.map((category) => category.toString()).toList();
      return categories;
    } else {
      throw Exception('Failed to get categories');
    }
  }

  // GET ALL PRODUCTS

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Product> products =
          body.map((product) => Product.fromJson(product)).toList();
      return products;
    } else {
      throw Exception('Failed to get products');
    }
  }
}
