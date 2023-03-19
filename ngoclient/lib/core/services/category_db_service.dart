import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ngoclient/core/models/subcategory_model.dart';

import '../models/category_model copy.dart';
import '../models/category_model.dart';

class DatabaseServiceCategory {
  /*static final categoriesDB = FirebaseFirestore.instance
      .collection('categories')
      .withConverter<CategoryModel>(
          fromFirestore: (snapshots, _) =>
              CategoryModel.fromJson(snapshots.data()!),
          toFirestore: (toFirestore, _) => toFirestore.toJson());*/

  static final categoriesDB2 = FirebaseFirestore.instance
      .collection('categories')
      .withConverter<CategoryModel2>(
          fromFirestore: (snapshots, _) =>
              CategoryModel2.fromJson(snapshots.data()!),
          toFirestore: (toFirestore, _) => toFirestore.toJson());

  // Future<QuerySnapshot<CategoryModel>> getCategories() async {
  //   try {
  //     return categoriesDB.get();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> update(String docRef, CategoryModel2 selectedCategory) async {
    try {
      FirebaseFirestore.instance
          .collection('categories')
          .doc(docRef)
          .set(selectedCategory.toJson());
    } catch (error) {
      print(error);
      throw error;
    }
  }

  init() async {
    List<SubCategoryModel> food = [
      SubCategoryModel(
          name: "perisabile", icon: Icons.gradient.codePoint, total: 0),
      SubCategoryModel(
          name: "mancare gatita", icon: Icons.lunch_dining.codePoint, total: 0),
    ];
    List<SubCategoryModel> electro_mici = [
      SubCategoryModel(name: "mixer", icon: Icons.blender.codePoint, total: 0),
      SubCategoryModel(
          name: "microunde", icon: Icons.microwave.codePoint, total: 0),
    ];

    List<SubCategoryModel> mobila = [
      SubCategoryModel(name: "scaun", icon: Icons.chair.codePoint, total: 0),
      SubCategoryModel(
          name: "canapea", icon: Icons.weekend.codePoint, total: 0),
      SubCategoryModel(name: "pat", icon: Icons.bed.codePoint, total: 0),
    ];

    List<CategoryModel2> initData = [
      CategoryModel2(
        name: "mancare",
        icon: Icons.food_bank.codePoint,
        subcategory: List.of(food),
      ),
      CategoryModel2(
        name: "electrocasnice mici",
        icon: Icons.electric_bolt.codePoint,
        subcategory: List.of(electro_mici),
      ),
      CategoryModel2(
        name: "mobila",
        icon: Icons.bed.codePoint,
        subcategory: List.of(mobila),
      )
    ];

    initData.forEach((element) {
      try {
        var ref = categoriesDB2.add(element);
      } catch (error) {
        print(error);
        throw error;
      }
    });
  }
}
