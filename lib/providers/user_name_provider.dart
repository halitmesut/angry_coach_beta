import 'package:flutter/material.dart';

class UserNamee with ChangeNotifier {
  String _userNamee = "";
  String get userNamee => _userNamee;

  void setUserName(String inputNameController) {
    _userNamee = inputNameController;
    notifyListeners();
  }
}
