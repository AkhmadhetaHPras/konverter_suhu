import 'package:flutter/material.dart';

class Result with ChangeNotifier {
  double _result = 0;

  double get result => _result;

  void convert(String temp, double numb) {
    _result = numb;
    if (temp == 'Kelvin') {
      _result = _result + 273.15;
    } else if (temp == 'Reamur') {
      _result = 0.8 * _result;
    } else {
      _result = 1.8 * _result + 32;
    }
    notifyListeners();
  }
}
