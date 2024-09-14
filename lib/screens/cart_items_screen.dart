import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:dummycommerce/core/widgets/cart_details/cart_item.dart';
import 'package:dummycommerce/model/product_model.dart';
import 'package:dummycommerce/service/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemsScreen extends StatefulWidget {
  const CartItemsScreen({super.key});

  @override
  State<CartItemsScreen> createState() => _CartItemsScreenState();
}

class _CartItemsScreenState extends State<CartItemsScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Cart:',
                      style: RootTextStyle.rootTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: RootColor.titleColor,
                      )),
                  Text('${cartProvider.cartItems.length} items in cart',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Container(
                height: 2.0,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                decoration: BoxDecoration(
                  color: RootColor.borderColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    Product product =
                        cartProvider.cartItems.keys.elementAt(index);
                    int quantity = cartProvider.cartItems[product]!;
                    return CartItem(
                      product: product,
                      quantity: quantity,
                      onIncrement: () => cartProvider.incrementCounter(product),
                      onDecrement: () => cartProvider.decrementCounter(product),
                      onDeleteProduct: () =>
                          cartProvider.removeItemFromCart(product),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
