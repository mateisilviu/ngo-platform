import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/models/category_model.dart';
import '../../core/models/ngo.dart';
import '../../core/models/subcategory_model.dart';

class MatchScreen extends StatelessWidget {
  final CategoryModel selectedCategory;
  final SubCategoryModel selectedSubCategory;

  MatchScreen(
      {required this.selectedCategory, required this.selectedSubCategory});

  List<NGO> ngoList = [
    NGO(
        name: "Centrul de batrani X",
        address: "Bucharest",
        geolocation: "lat/long"),
    NGO(
        name: "Centrul de copii Y",
        address: "Bucharest",
        geolocation: "lat/long"),
    NGO(
        name: "Centrul de reciclare haine Z",
        address: "Bucharest",
        geolocation: "lat/long"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory.name + " > " + selectedSubCategory.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Text("List of NGOs"),
          ),
          SizedBox(
            width: 50,
          ),
          Expanded(
            child: ListView.builder(
                // the number of items in the list
                itemCount: ngoList.length,

                // display each item of the product list
                itemBuilder: (context, index) {
                  return Card(
                    // In many cases, the key isn't mandatory
                    key: ValueKey(ngoList[index]),
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(ngoList[index].name)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
