import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/category_model copy.dart';
import '../../core/models/category_model.dart';
import '../../core/models/subcategory_model.dart';
import '../footer/footer.dart';
import '../parts/subcategory_item.dart';

class SubCategoryScreen extends StatelessWidget {
  // final List<SubCategoryModel> selectedSubcategoryList = [
  //   SubCategoryModel(name: "Tricouri", icon: "icon"),
  //   SubCategoryModel(name: "Pantaloni", icon: "icon"),
  //   SubCategoryModel(name: "Geci", icon: "icon"),
  // ];
  final CategoryModel2 item;
  final String docRef;
  SubCategoryScreen(this.item, this.docRef);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.name ?? "Error"),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  // the number of items in the list
                  itemCount: item.subcategory!.length,

                  // display each item of the product list
                  itemBuilder: (context, index) {
                    return SubCategoryItem(
                      selectedSubcategory: index,
                      selectedCategory: item,
                      docRef: docRef,
                    );
                  })),
          FooterComponent(),
        ])));
  }
}
