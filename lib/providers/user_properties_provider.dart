import 'package:flutter/material.dart';

class UserProperties with ChangeNotifier {
//  NAME  PROPERTY
  String _userName = "";
  String get userName => _userName;

  void getUserName(String inputNameController) {
    _userName = inputNameController;
    notifyListeners();
  }

// AGE PROPERTY
  int _userAge = 0;
  int get userAge => _userAge;

  void getUserAge(int setUserName) {
    _userAge = setUserName;
    notifyListeners();
  }

// GENDER PROPERTY
  String _userGender = "";
  String get userGender => _userGender;
  void getUserGender(String selectedGender) {
    _userGender = selectedGender;
    notifyListeners();
  }

// HEIGHT PROPERTY
  int _userHeight = 0;
  int get userHeight => _userHeight;
  void getUserHeight(int setUserHeight) {
    _userHeight = setUserHeight;
    notifyListeners();
  }

// WEIGHT PROPERTY
  int _userWeight = 0;
  int get userWeight => _userWeight;
  void getUserWeight(int setUserWeight) {
    _userWeight = setUserWeight;
    notifyListeners();
  }

// TARGET WEIGHT PROPERTY
  int _userTargetWeight = 0;
  int get userTargetWeight => _userTargetWeight;
  void getUserTargetWeight(int setUserTargetWeight) {
    _userTargetWeight = setUserTargetWeight;
    notifyListeners();
  }

//  ACTIVITY LEVEL
  String _userActivityLevel = "";
  String get userActivityLevel => _userActivityLevel;
  void getUserActivityLevel(String setUserActivityLevel) {
    _userActivityLevel = setUserActivityLevel;
    notifyListeners();
  }

//  DIET GOAL
  String _userDietGoal = "";
  String get userDietGoal => _userDietGoal;
  void getUserDietGoal(String setUserDietGoal) {
    _userDietGoal = setUserDietGoal;
    notifyListeners();
  }

// LANGUAGE
  String _userLanguage = "";
  String get userLanguage => _userLanguage;
  void getUserLanguage(setUserLanguage) {
    _userLanguage = setUserLanguage;
    notifyListeners();
  }

// COUNTRY
  String _userCountry = "";
  String get userCountry => _userCountry;

  void setUserCountry(String setUserCountry) {
    _userCountry = setUserCountry;
    notifyListeners();
  }
}
