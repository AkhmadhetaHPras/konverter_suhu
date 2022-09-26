import 'package:flutter/cupertino.dart';

class TemperatureDropdown with ChangeNotifier {
  final List<String> _listItem = ["Kelvin", "Reamur", "Fahrenheit"];

  String _selectedItem = 'Kelvin';

  get selectedItem => _selectedItem;

  get listItem => _listItem;

  set selected(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
