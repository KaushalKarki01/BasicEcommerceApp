import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:dummycommerce/core/widgets/product/cart_btn.dart';
import 'package:dummycommerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;
  final void Function()? onIncrement;
  final void Function()? onDecrement;
  final void Function()? onDeleteProduct;
  const CartItem({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDeleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * product.price;
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: RootColor.cardColor,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        leading: Image.network(product.image),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: RootTextStyle.rootTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: RootColor.titleColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toString()}',
                ),
                Row(
                  children: [
                    IconButton(
                      iconSize: 18,
                      onPressed: onDecrement,
                      icon: const Icon(
                        CupertinoIcons.minus,
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      style: RootTextStyle.rootTextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      iconSize: 18,
                      onPressed: onIncrement,
                      icon: const Icon(
                        CupertinoIcons.add,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Price: ${totalPrice.ceil()}'),
                const Spacer(),
                Expanded(child: CartBtn(title: 'Buy', onTap: () {}))
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: onDeleteProduct,
          icon: const Icon(CupertinoIcons.delete),
        ),
      ),
    );
  }
}
