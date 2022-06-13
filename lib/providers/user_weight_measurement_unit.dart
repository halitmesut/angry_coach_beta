import 'package:flutter/material.dart';

class UserWeightMeasurementUnit with ChangeNotifier {
  String _userWeightMeasurementUnit = "Kg";
  String get userWeightMeasurementUnit => _userWeightMeasurementUnit;

  void setUserWeightMeasurementUnit(String selectedWeightMeasurementUnit) {
    _userWeightMeasurementUnit = selectedWeightMeasurementUnit;
    notifyListeners();
  }
}
