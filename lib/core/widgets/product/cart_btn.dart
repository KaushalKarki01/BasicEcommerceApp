import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:flutter/material.dart';

class CartBtn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CartBtn({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: RootColor.btnColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(title,
              style: RootTextStyle.rootTextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
