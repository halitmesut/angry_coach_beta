import 'package:flutter/material.dart';

class UserGender with ChangeNotifier {
  String _userGender = "";
  String get userGender => _userGender;

  void setUserGender(String selectedGender) {
    _userGender = selectedGender;
    notifyListeners();
  }
}
