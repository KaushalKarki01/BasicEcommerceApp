import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/widgets/category_list/category_list.dart';
import 'package:dummycommerce/core/widgets/product/all_products.dart';
import 'package:dummycommerce/core/widgets/search/search_field.dart';
import 'package:dummycommerce/service/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RootColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi, Kaushal',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black87),
                  ),
                  IconButton(
                    onPressed: () {
                      ApiService().getAllProducts();
                    },
                    icon: const Icon(
                      CupertinoIcons.shopping_cart,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //search field
              SearchField(),

              //categories
              const SizedBox(height: 20),
              const CategoryList(),
              const SizedBox(height: 20),

              // DISPLAY ALL THE PRODUCTS
              const Expanded(
                child: AllProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
