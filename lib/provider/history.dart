import 'package:flutter/material.dart';

class History with ChangeNotifier {
  final List<String> _listHasil = [];

  get listHasil => _listHasil;

  void addListHasil(String item) {
    _listHasil.add(item);
  }
}
