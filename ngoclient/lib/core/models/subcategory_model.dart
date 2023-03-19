class SubCategoryModel {
  SubCategoryModel(
      {required this.name, required this.icon, required this.total});

  final String name;
  final int icon;
  int total;

  SubCategoryModel.fromJson(Map<String, dynamic> json)
      : this(
          // id: json['id'] as String,
          name: json['name'] as String,
          icon: json['icon']! as int,
          total: json['total']! as int,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['total'] = this.total;
    return data;
  }
}
