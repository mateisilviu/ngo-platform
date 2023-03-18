import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceNGO {
  static final ngoDatabase = FirebaseFirestore.instance.collection('ngo');
}
