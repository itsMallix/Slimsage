import 'dart:async';
import 'dart:math';

class CalculateBmi {
  late final int height;
  late final int weight;
  late double result;
  late String message = "Normal";

  CalculateBmi({required this.height, required this.weight});

  calculateResult() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getDescription() {
    if (result > 25) {
      message = "Overweight";
      return "You have a higher than normal body weight. Try to exercise more.";
    }
    if (result > 18.5) {
      message = "Normal";
      return "You have a normal body weight. Good job!";
    }
    if (result < 18.5) {
      message = "UnderWeight";
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
    return "";
  }
}
