import 'package:flutter/material.dart';

class UserProperties with ChangeNotifier {
//  NAME  PROPERTY
  String _userName = "";
  String get userName => _userName;

  void setUserName(String inputNameController) {
    _userName = inputNameController;
    notifyListeners();
  }

// GENDER PROPERTY
  String _userGender = "";
  String get userGender => _userGender;

  void setUserGender(String selectedGender) {
    _userGender = selectedGender;
    notifyListeners();
  }

// AGE PROPERTY
  int _userAge = 0;
  int get userAge => _userAge;

  void getUserAge(int setUserName) {
    _userAge = setUserName;
    notifyListeners();
  }

// WEIGHT PROPERTY

}
