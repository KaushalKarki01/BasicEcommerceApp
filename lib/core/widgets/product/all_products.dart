import 'package:dummycommerce/core/widgets/product/product_card.dart';
import 'package:dummycommerce/model/product_model.dart';
import 'package:dummycommerce/service/api/api_service.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final apiService = ApiService();
  final List<Product> _products = [];

  void _getAllProducts() async {
    try {
      final allProducts = await apiService.getAllProducts();
      setState(() {
        _products.addAll(allProducts);
      });
    } catch (e) {
      print('Error getting all products:$e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getAllProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final List<Product>? allProducts = snapshot.data;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemCount: allProducts!.length,
            itemBuilder: (context, index) {
              final product = allProducts[index];
              return ProductCard(product: product);
            },
          );
        } else {
          return const Text('Failed to get products');
        }
      },
    );
  }
}
