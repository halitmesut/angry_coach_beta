import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int weight;
  final int height;

  double? _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 28.0) {
      return "OverWeight";
    } else if (_bmi! >= 19.0) {
      return "Normal ";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi! >= 28.0) {
      return "Your weight is higher than normal weight. Try to excersize more!";
    } else if (_bmi! >= 19.0) {
      return "Your weight is normal. Good job. ";
    } else {
      return "Your weight is lower than normal weight. You have to eat more!";
    }
  }
}
