import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';

class DatabaseServiceCategory {
  static final categoriesDB = FirebaseFirestore.instance
      .collection('categories')
      .withConverter<CategoryModel>(
          fromFirestore: (snapshots, _) =>
              CategoryModel.fromJson(snapshots.data()!),
          toFirestore: (toFirestore, _) => toFirestore.toJson());

  Future<QuerySnapshot<CategoryModel>> getCategories() async {
    try {
      return categoriesDB.get();
    } catch (e) {
      rethrow;
    }
  }
}
