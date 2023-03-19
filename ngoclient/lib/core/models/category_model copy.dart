import 'package:flutter/material.dart';

import 'subcategory_model.dart';

class CategoryModel2 {
  CategoryModel2({this.name, this.icon, this.subcategory});

  //String? id;
  String? name;
  int? icon;
  List<SubCategoryModel>? subcategory;

  CategoryModel2.fromJson(Map<String, dynamic> json) {
    //  id = json['id'];
    name = json['name'];
    icon = json['icon'];
    if (json['subcategory'] != null) {
      subcategory = <SubCategoryModel>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new SubCategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
