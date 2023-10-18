import 'dart:math';

import 'package:meu_app_calc_imc/utils.dart';

double? calculateIMC(double weight, double height) {
  //print("weight=$weight / Height=$height");
  if (weight <= 0) {
    print("FAIL: Invalid value for weight(=$weight).");
    return null;
  }

  if (weight < 1) {
    print("WARN: This weight(=$weight) is correct? (very small!)");
  }

  if (weight > 500) {
    print("WARN: Hey, this weight(=$weight) is correct? (very high!)");
  }

  if (height <= 0) {
    print("FAIL: Invalid height(=$height)!");
    return null;
  }

  if (height < 0.1) {
    print("WARN: This height(=$height) is correct? (very small!)");
  }

  if (height > 3.00) {
    print("WARN: This height(=$height) is correct? (very high!)");
  }

  try {
    return roundDouble(weight / pow(height, 2), 1);
  } catch (e) {
    return null;
  }
}

String getIMCClassification(double? imc) {
  switch (imc) {
    case null:
      return "FAIL: Value for IMC cannot be null!";

    case <= 0:
      return "FAIL: Value 0 for IMC is invalid!";

    case < 16:
      return "Severe Thinness";

    case < 17:
      return "Moderate Thinness";

    case < 18.5:
      return "Soft Thinness";

    case < 25:
      return "Healthy";

    case < 30:
      return "Overweight";

    case < 35:
      return "Obesity - Degree I";

    case < 40:
      return "Obesity - Degree II (severe)";

    default:
      return "Obesity - Degree III (morbid)";
  }
}
