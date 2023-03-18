import 'package:flutter/material.dart';
import 'package:ngoclient/core/models/category_model.dart';
import 'package:ngoclient/ui/screens/match_screen.dart';

import '../../core/models/subcategory_model.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    required this.selectedCategory,
    required this.selectedSubcategory,
  });

  final CategoryModel selectedCategory;
  final SubCategoryModel selectedSubcategory;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MatchScreen(
                selectedCategory: selectedCategory,
                selectedSubCategory: selectedSubcategory),
          ),
        )
      },
      child: Card(
          // In many cases, the key isn't mandatory
          key: ValueKey(selectedSubcategory),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(selectedSubcategory.name))),
    );
  }
}
