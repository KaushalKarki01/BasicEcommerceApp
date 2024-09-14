import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:dummycommerce/core/widgets/product/cart_btn.dart';
import 'package:dummycommerce/core/widgets/toast%20and%20badges/toast_message.dart';
import 'package:dummycommerce/model/product_model.dart';
import 'package:dummycommerce/service/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    //display toast message
    void showToast() {
      ToastMessage().displayToastMessage('item added to cart');
      cartProvider.addItemToCart(product);
    }

    return Scaffold(
      backgroundColor: RootColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main image
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    product.image,
                    height: height,
                  ),
                ),
                const SizedBox(height: 10),

                //title of product
                Text(
                  product.title,
                  style: RootTextStyle.rootTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: RootColor.titleColor,
                  ),
                ),

                const SizedBox(height: 10),

                //price
                Text(
                  '\$${product.price.toString()}',
                  style: RootTextStyle.rootTextStyle(
                    fontWeight: FontWeight.bold,
                    color: RootColor.priceColor,
                  ),
                ),

                const SizedBox(height: 20),

                //Description
                const Text(
                  'DESCRIPTION:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  product.description,
                  style: RootTextStyle.rootTextStyle(
                    fontSize: 14,
                    color: RootColor.titleColor,
                  ),
                ),

                const SizedBox(height: 30),

                //add to cart button
                CartBtn(title: 'Add to Cart', onTap: showToast),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
