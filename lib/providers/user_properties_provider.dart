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

  void getUserCountry(String setUserCountry) {
    _userCountry = setUserCountry;
    notifyListeners();
  }

  // USER PROMISE
  String _userPromise = "";
  String get userPromise => _userPromise;

  void getUserPromise(String setUserPromise) {
    _userPromise = setUserPromise;
    notifyListeners();
  }

  // RECOMMENDED DAILY INTAKE

  double _recommendedDailyIntake = 0;
  int get recommendedDailyIntake => _recommendedDailyIntake.toInt();

  void getReccommendedDailyIntake() {
    if (_userGender == "Male" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4 -
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4 -
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.4;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4 +
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4 +
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 -
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 -
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.6;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 +
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 +
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7 -
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7 -
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.7;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7 +
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7 +
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1 -
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1 -
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.1;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1 +
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1 +
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4 -
              500;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4 -
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.4;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4 +
              250;
    } else if (_userGender == "Male" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4 +
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.3 -
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.3 -
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.3;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.3 +
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Low Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.3 +
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.5 -
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.5 -
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.5;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.5 +
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Low Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.5 +
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 -
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 -
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.6;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 +
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6 +
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.9 -
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.9 -
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 1.9;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.9 +
              250;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.9 +
              500;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.2;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Slow weight loss") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.2;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Maintain my current weight") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.2;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Slow weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.2;
    } else if (_userGender == "Female" &&
        _userActivityLevel == "Very High Active" &&
        _userDietGoal == "Weight gain") {
      _recommendedDailyIntake =
          (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) * 2.2;
    }

    notifyListeners();
  }
}
