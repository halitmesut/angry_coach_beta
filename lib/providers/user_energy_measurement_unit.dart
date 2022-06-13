import 'package:flutter/material.dart';

class UserEnergyMeasurementUnit with ChangeNotifier {
  String _userEnergyMeasurementUnit = "Calories";
  String get userEnergyMeasurementUnit => _userEnergyMeasurementUnit;

  void setUserEnergyMeasurementUnit(String selectedEnergyMeasurementUnit) {
    _userEnergyMeasurementUnit = selectedEnergyMeasurementUnit;
    notifyListeners();
  }
}
