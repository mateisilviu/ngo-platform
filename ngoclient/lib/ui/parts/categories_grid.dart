import 'package:flutter/material.dart';
import 'package:ngoclient/core/models/category_model.dart';

import '../../core/util/app-constants.dart';
import '../../core/util/responsive.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  List<CategoryModel> categories = [
    CategoryModel(name: "Haine", icon: "icon"),
    CategoryModel(name: "Mancare", icon: "icon"),
    CategoryModel(name: "Electronice mici", icon: "icon"),
    CategoryModel(name: "Mobila", icon: "icon"),
  ];

  @override
  Widget build(BuildContext context) {
    var responsivePadding = ResponsiveWidget.isSmallScreen(context)
        ? AppConstants.PADDING / 5
        : ResponsiveWidget.isMediumScreen(context)
            ? AppConstants.PADDING / 2
            : AppConstants.PADDING;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: categories.length,
      itemBuilder: (ctx, i) => CategoryItem(categories[i] as CategoryModel),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: ResponsiveWidget.calculateCrossAxisCount(context),
        childAspectRatio: ResponsiveWidget.isMediumScreen(context) ? 1 : 5 / 4,
        crossAxisSpacing: responsivePadding / 2,
        mainAxisSpacing: responsivePadding / 4,
      ),
    );
  }
}
