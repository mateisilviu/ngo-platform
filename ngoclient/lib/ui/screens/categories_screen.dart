import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ngoclient/ui/parts/categories_grid.dart';

import '../footer/footer.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorii"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: CategoriesGrid()),
          FooterComponent(),
        ],
      )),
    );
  }
}
