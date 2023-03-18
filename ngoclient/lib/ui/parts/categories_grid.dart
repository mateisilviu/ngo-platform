import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngoclient/core/models/category_model.dart';

import '../../core/services/category_db_service.dart';
import '../../core/util/app-constants.dart';
import '../../core/util/responsive.dart';
import 'category_item.dart';

class CategoriesGrid extends StatelessWidget {
  // List<CategoryModel> categories = [
  //   CategoryModel(name: "Haine", icon: "icon"),
  //   CategoryModel(name: "Mancare", icon: "icon"),
  //   CategoryModel(name: "Electronice mici", icon: "icon"),
  //   CategoryModel(name: "Mobila", icon: "icon"),
  // ];

  @override
  Widget build(BuildContext context) {
    var responsivePadding = ResponsiveWidget.isSmallScreen(context)
        ? AppConstants.PADDING / 5
        : ResponsiveWidget.isMediumScreen(context)
            ? AppConstants.PADDING / 2
            : AppConstants.PADDING;
    return StreamBuilder(
        stream: DatabaseServiceCategory.categoriesDB.snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> categoriesSnapshot) {
          if (categoriesSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final categoriesDocs = categoriesSnapshot.requireData.docs;
          return GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: categoriesDocs.length,
            itemBuilder: (ctx, i) =>
                CategoryItem(categoriesDocs[i].data() as CategoryModel),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveWidget.calculateCrossAxisCount(context),
              childAspectRatio:
                  ResponsiveWidget.isMediumScreen(context) ? 1 : 5 / 4,
              crossAxisSpacing: responsivePadding / 2,
              mainAxisSpacing: responsivePadding / 4,
            ),
          );
        });
  }
}
