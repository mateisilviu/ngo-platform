import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel item;
  const CategoryItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 100,
      height: 100,
      child: Center(child: Text(item.name)),
    ));
  }
}
