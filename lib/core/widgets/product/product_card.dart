import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:dummycommerce/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                product.image.isNotEmpty ? product.image : '',
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/dummy_image.jpg'),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: RootTextStyle.rootTextStyle(
                fontSize: 12,
                color: RootColor.titleColor,
              ),
            ),
            Text(
              '\$${product.price.toString()}',
              style: RootTextStyle.rootTextStyle(
                fontWeight: FontWeight.bold,
                color: RootColor.priceColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
