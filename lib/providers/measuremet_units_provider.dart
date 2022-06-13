import 'package:flutter/material.dart';

class MeasuremetUnits with ChangeNotifier {
  // HEIGHT UNIT
  String _heightUnit = "Cm";
  String get heightUnit => _heightUnit;
  void getUserHeightUnit(String setUserHeightUnit) {
    _heightUnit = setUserHeightUnit;
    notifyListeners();
  }

  //WEIGHT UNIT
  String _weightUnit = "Kg";
  String get weightUnit => _weightUnit;
  void getUserWeightUnit(setUserWeightUnit) {
    _weightUnit = setUserWeightUnit;
    notifyListeners();
  }

  //VOLUME UNIT
  String _volumeUnit = "ml";
  String get volumeUnit => _volumeUnit;
  void getUserVolumeUnit(setUserVolumeUnit) {
    _volumeUnit = setUserVolumeUnit;
    notifyListeners();
  }

  //ENERGY UNIT
  String _energyUnit = "Calories";
  String get energyUnit => _energyUnit;
  void getUserEnergyUnit(setUserEnergyUnit) {
    _energyUnit = setUserEnergyUnit;
    notifyListeners();
  }
}
