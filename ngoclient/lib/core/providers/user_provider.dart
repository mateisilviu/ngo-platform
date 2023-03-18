import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  bool isDonator = false;
  bool isNGO = false;
  bool isCompany = false;

  void loginDonator() {
    isDonator = true;
    isNGO = false;
    isCompany = false;
    notifyListeners();
  }

  void loginNGO() {
    isDonator = false;
    isNGO = true;
    isCompany = false;
    notifyListeners();
  }

  void loginCompany() {
    isDonator = false;
    isNGO = false;
    isCompany = true;
    notifyListeners();
  }
}
