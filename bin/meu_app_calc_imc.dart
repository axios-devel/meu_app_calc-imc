import 'dart:convert';
import 'dart:io';

import 'package:meu_app_calc_imc/classes/Person.dart';
import 'package:meu_app_calc_imc/meu_app_calc_imc.dart';

void main(List<String> arguments) {
  List<Person> persons = [];

  print("IMC Calculator");
  print("--------------");

  while (true) {
    // Get the name of person
    print(">> Enter the new person name: (or type . to bye bye) ");
    var getLine = stdin.readLineSync(encoding: utf8);
    if (getLine == ".") {
      print("Bye bye...");
      break;
    }

    if (getLine == "" || getLine == null) {
      print("Invalid entry! Looping...");
      continue;
    }

    String _personName = getLine;

    // Get the height of person
    print("Enter the height (meter):");
    getLine = stdin.readLineSync(encoding: utf8);
    var _personHeight = double.tryParse(getLine!);

    if (_personHeight == null) {
      print("Invalid height value! Looping...");
      continue;
    }
    // Get the weight of person
    print("Enter the weight (kilogram):");
    getLine = stdin.readLineSync(encoding: utf8);
    var _personWeight = double.tryParse(getLine!);

    if (_personWeight == null) {
      print("Invalid weight value! Looping...");
      continue;
    }

    var calcIMC = calculateIMC(_personWeight, _personHeight);

    if (calcIMC == null) {
      print("FAIL: Wrong parameters values! Please review values...");
      continue;
    }

    print('==> The IMC for "$_personName" is: $calcIMC');
    print("==> IMC Classification: ${getIMCClassification(calcIMC)}");
    print("\n");

    //Save patient data
    persons.add(Person(_personName, _personHeight, _personWeight));
  }
}
