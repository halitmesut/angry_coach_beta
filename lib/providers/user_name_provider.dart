import 'package:flutter/material.dart';

class UserNamee with ChangeNotifier {
  String _userName = "";
  String get userName => _userName;

  void setUserName(String inputNameController) {
    _userName = inputNameController;
    notifyListeners();
  }
}
