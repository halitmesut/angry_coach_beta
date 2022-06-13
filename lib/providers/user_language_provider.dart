import 'package:flutter/material.dart';

class UserLanguage with ChangeNotifier {
  String _userLanguage = "";
  String get userLanguage => _userLanguage;

  void setUserLanguage(String selectedLanguage) {
    _userLanguage = selectedLanguage;
    notifyListeners();
  }
}
