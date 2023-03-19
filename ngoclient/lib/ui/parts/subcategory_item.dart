import 'package:flutter/material.dart';
import 'package:ngoclient/core/models/category_model.dart';
import 'package:ngoclient/ui/screens/match_screen.dart';
import 'package:provider/provider.dart';

import '../../core/models/category_model copy.dart';
import '../../core/models/subcategory_model.dart';
import '../../core/providers/user_provider.dart';
import '../../ngo_admin/screens/add_requirements.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem(
      {required this.selectedCategory,
      required this.selectedSubcategory,
      required this.docRef});

  final CategoryModel2 selectedCategory;
  final int selectedSubcategory;
  final String docRef;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(builder: (context, user, child) {
      return GestureDetector(
        onTap: () => {
          if (user.isDonator == true)
            {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MatchScreen(
                      selectedCategory: selectedCategory,
                      selectedSubCategory: selectedSubcategory),
                ),
              )
            },
          if (user.isNGO == true)
            {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddNGORequirements(
                    selectedCategory: selectedCategory,
                    selectedSubCategory: selectedSubcategory,
                    docRef: docRef,
                  ),
                ),
              )
            }
        },
        child: Card(
            // In many cases, the key isn't mandatory
            key: ValueKey(selectedSubcategory),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      IconData(
                          selectedCategory
                              .subcategory![selectedSubcategory].icon,
                          fontFamily: 'MaterialIcons'),
                      size: 20,
                    ),
                    Text(
                        selectedCategory.subcategory![selectedSubcategory].name,
                        style: TextStyle(fontSize: 20)),
                    Text(
                        "Total necesar ${selectedCategory.subcategory![selectedSubcategory].total}",
                        style: TextStyle(fontSize: 20)),
                  ],
                ))),
      );
    });
  }
}
