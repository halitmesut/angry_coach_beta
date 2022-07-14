class RecommendedDailyIntake {
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

  double recommendedDailyIntakeFunction() {
    if (userGender == "Male") {
      if (userDietGoal == "Weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 -
                  500;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Slow weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 -
                  250;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Maintain my current weight") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.4;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.7;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.1;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.4;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Slow weight gain") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 +
                  250;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Weight gain") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.4 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.7 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.1 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.4 +
                  500;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else {
        recommendedCalorie = 444;
        return recommendedCalorie;
      }
    } else if (userGender == "Female") {
      if (userDietGoal == "Weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.3 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.5 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.9 -
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.2 -
                  500;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Slow weight loss") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.3 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.5 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.9 -
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.2 -
                  250;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Maintain my current weight") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.3;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.5;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.6;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  1.9;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                  2.2;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Slow weight gain") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.3 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.5 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.9 +
                  250;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.2 +
                  250;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else if (userDietGoal == "Weight gain") {
        if (userActivityLevel == "Very Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.3 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Low Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.5 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.6 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      1.9 +
                  500;
          return recommendedCalorie;
        } else if (userActivityLevel == "Very High Active") {
          recommendedCalorie =
              (66 + (5 * userHeight) + (13.8 * userWeight) - (6.8 * userAge)) *
                      2.2 +
                  500;
          return recommendedCalorie;
        } else {
          recommendedCalorie = 444;
          return recommendedCalorie;
        }
      } else {
        recommendedCalorie = 444;
        return recommendedCalorie;
      }
    } else {
      recommendedCalorie = 444;
      return recommendedCalorie;
    }
  }
}
