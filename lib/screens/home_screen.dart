import 'package:badges/badges.dart' as badges;
import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/widgets/category_list/category_list.dart';
import 'package:dummycommerce/core/widgets/product/all_products.dart';
import 'package:dummycommerce/core/widgets/search/search_field.dart';
import 'package:dummycommerce/screens/cart_items_screen.dart';
import 'package:dummycommerce/service/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: RootColor.background,
      appBar: AppBar(
        backgroundColor: RootColor.background,
        toolbarHeight: 0,
      ),
      body: Padding(
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
                      color: RootColor.btnColor),
                ),
                badges.Badge(
                  position: badges.BadgePosition.topEnd(
                    top: -10,
                    end: -12,
                  ),
                  badgeAnimation: const badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                  ),
                  badgeContent: Text(cartProvider.cartItems.length.toString()),
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: RootColor.btnColor,
                    elevation: 0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartItemsScreen()));
                    },
                    icon: const Icon(
                      CupertinoIcons.shopping_cart,
                      size: 30,
                    ),
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
    );
  }
}
