import 'package:dummycommerce/core/widgets/category_list/category_button.dart';
import 'package:dummycommerce/service/api/api_service.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  //instance of apiservice
  final apiService = ApiService();
  final List<String> _categories = [];

  void _fetchCategories() async {
    try {
      final categories = await apiService.getAllCategories();
      setState(() {
        _categories.addAll(categories);
      });
    } catch (e) {
      print('Error getting categories:$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            return CategoryButton(
              title: category,
            );
          },
        ));
  }
}
