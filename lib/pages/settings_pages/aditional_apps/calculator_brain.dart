import 'dart:math';

import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/basal_metabolic_rate_screen.dart';
import 'package:angry_coach_beta/pages/settings_pages/aditional_apps/body_mass_index_screen.dart';

class CalculatorBrain {
  int age = 30;
  int weight = 60;
  int height = 170;
  Gender selecteddGender = Gender.female;

  CalculatorBrain({
    required this.age,
    required this.weight,
    required this.height,
    required this.selecteddGender,
  });

  double bmi = 20.8;
  late double basalMetabolismicRate;

  String boadyMassIndex() {
    bmi = weight / pow(height / 100, 2);

    return bmi.toStringAsFixed(1);
  }

  String getStatusExplanation() {
    bmi = weight / pow(height / 100, 2);

    if (bmi >= 28.0) {
      return "OverWeight";
    } else if (bmi >= 19.0) {
      return "Normal ";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    bmi = weight / pow(height / 100, 2);
    if (bmi >= 28.0) {
      return "Your weight is higher than normal weight. Try to excersize more!";
    } else if (bmi >= 19.0) {
      return "Your weight is normal. Good job. ";
    } else {
      return "Your weight is lower than normal weight. You have to eat more!";
    }
  }

  String getBasalMetabolismicRate() {
    if (selecteddGender == Gender.female) {
      basalMetabolismicRate =
          655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
      return basalMetabolismicRate.toStringAsFixed(1);
    } else {
      basalMetabolismicRate = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
      return basalMetabolismicRate.toStringAsFixed(1);
    }
  }
}
