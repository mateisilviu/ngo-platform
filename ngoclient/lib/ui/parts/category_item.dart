import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngoclient/ui/screens/sub_category_screen.dart';

import '../../core/models/category_model copy.dart';
import '../../core/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel2 item;
  final String docRef;
  const CategoryItem(this.item, this.docRef);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SubCategoryScreen(item, docRef),
          ),
        )
      },
      child: Card(
          child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(IconData(item.icon!, fontFamily: 'MaterialIcons'), size: 26),
            Text(item.name ?? "N/A", style: TextStyle(fontSize: 26)),
          ],
        )),
      )),
    );
  }
}
