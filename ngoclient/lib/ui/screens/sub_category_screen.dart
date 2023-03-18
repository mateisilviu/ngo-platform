import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/category_model.dart';
import '../../core/models/subcategory_model.dart';
import '../parts/subcategory_item.dart';

class SubCategoryScreen extends StatelessWidget {
  final List<SubCategoryModel> selectedSubcategoryList = [
    SubCategoryModel(name: "Tricouri", icon: "icon"),
    SubCategoryModel(name: "Pantaloni", icon: "icon"),
    SubCategoryModel(name: "Geci", icon: "icon"),
  ];
  final CategoryModel item;
  SubCategoryScreen(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.name),
        ),
        body: ListView.builder(
            // the number of items in the list
            itemCount: selectedSubcategoryList.length,

            // display each item of the product list
            itemBuilder: (context, index) {
              return SubCategoryItem(
                selectedSubcategory: selectedSubcategoryList[index],
                selectedCategory: item,
              );
            }));
  }
}
