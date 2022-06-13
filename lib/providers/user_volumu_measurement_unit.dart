import 'package:flutter/material.dart';

class UserVolumeMeasurementUnit with ChangeNotifier {
  String _userVolumeMeasurementUnit = "ml";
  String get userVolumeMeasurementUnit => _userVolumeMeasurementUnit;

  void setUserVolumeMeasurementUnit(String selectetVolumeMeasurementUnit) {
    _userVolumeMeasurementUnit = selectetVolumeMeasurementUnit;
    notifyListeners();
  }
}
