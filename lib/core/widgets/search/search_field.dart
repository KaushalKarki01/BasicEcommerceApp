import 'package:dummycommerce/core/widgets/search/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SearchTextField(controller: _searchController)),
          const SizedBox(width: 8.0),
          Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
