import 'package:dummycommerce/core/colors/root_color.dart';
import 'package:dummycommerce/core/styles/text_style.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  const CategoryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: RootColor.borderColor,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Center(
        child: Text(
          title,
          style: RootTextStyle.rootTextStyle(
            fontSize: 14,
            color: RootColor.titleColor,
          ),
        ),
      ),
    );
  }
}
