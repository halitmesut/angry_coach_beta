import 'package:flutter/material.dart';

class UserHeightMeasurementUnit with ChangeNotifier {
  String _userHeightMeasurementUnit = "Cm";
  String get userHeightMeasurementUnit => _userHeightMeasurementUnit;

  void setUserHeightMeasurementUnit(String selectedHeightMeasurementUnit) {
    _userHeightMeasurementUnit = selectedHeightMeasurementUnit;
    notifyListeners();
  }
}
