import 'package:flutter/material.dart';

class UserCountry with ChangeNotifier {
  String _userCountry = "";
  String get userCountry => _userCountry;

  void setUserCountry(String selectedCountry) {
    _userCountry = selectedCountry;
    notifyListeners();
  }
}
