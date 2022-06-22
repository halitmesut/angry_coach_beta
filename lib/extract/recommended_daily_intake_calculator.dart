//import 'package:flutter/material.dart';
//import 'package:hive_flutter/hive_flutter.dart';

//var box = Hive.box("userProperties");

class RecommendedDailyIntake {
  // late int userAge;  //int.parse(box.get("userAge"));
  //late int userWeight; //int.parse(box.get("userWeight"));
  //late int userHeight; //int.parse(box.get("userHeight"));
  late String userGender;
  late String userDietGoal;
  late String userActivityLevel;
  late int userHeight;
  late int userWeight;
  late int userAge;

  RecommendedDailyIntake({
    required this.userGender,
    required this.userDietGoal,
    required this.userActivityLevel,
    required this.userHeight,
    required this.userWeight,
    required this.userAge,
  });

  late double recommendedCalorie;
  // late double basalMetabolismicRate;

  String recommendedDailyIntakeFunction() {
    if (userGender == "Male") {
      if (userDietGoal == "Weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 -
                  500;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  500;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 -
                  500;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 -
                  500;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 -
                  500;
          return recommendedCalorie.toStringAsFixed(0);
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Slow weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 -
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 -
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 -
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 -
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Maintain my current weight") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4;
          return recommendedCalorie.toStringAsFixed(0);
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Slow weight gain") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 +
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 +
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 +
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 +
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 +
                  250;
          return recommendedCalorie.toStringAsFixed(0);
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Weight gain") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else {
        recommendedCalorie = 444;
        return recommendedCalorie.toStringAsFixed(0);
      }

      recommendedCalorie = 2222.2;
      return recommendedCalorie.toStringAsFixed(1);
    } else if (userGender == "Female") {
      if (userDietGoal == "Weight loss") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Slow weight loss") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Maintain my current weight") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Slow weight gain") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else if (userDietGoal == "Weight gain") {
        if (userActivityLevel == "Very Low Active") {
        } else if (userActivityLevel == "Low Active") {
        } else if (userActivityLevel == "Active") {
        } else if (userActivityLevel == "Very Active") {
        } else if (userActivityLevel == "Very High Active") {
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie.toStringAsFixed(0);
        }
      } else {
        recommendedCalorie = 444;
        return recommendedCalorie.toStringAsFixed(0);
      }

      recommendedCalorie = 2222.2;
      return recommendedCalorie.toStringAsFixed(1);
    } else {
      recommendedCalorie = 444;
      return recommendedCalorie.toStringAsFixed(0);
    }
  }

  // String getStatusExplanation() {
  //   bmi = userWeight / pow(userHeight / 100, 2);

  //   if (bmi >= 28.0) {
  //     return "OverWeight";
  //   } else if (bmi >= 19.0) {
  //     return "Normal ";
  //   } else {
  //     return "Underweight";
  //   }
  // }
}
