import 'package:meu_app_calc_imc/meu_app_calc_imc.dart';
import 'package:meu_app_calc_imc/utils.dart';
import 'package:test/test.dart';

void main() {
  test('calculate IMC', () {
    double calcIMC = calculateIMC(68, 1.35) ?? 0.0;
    expect(calcIMC, 37.3);
  });

  test('Classificate IMC', () {
    double calcIMC = calculateIMC(68, 1.35) ?? 0.0;
    expect(getIMCClassification(calcIMC), "Obesity - Degree II (severe)");
  });
}
