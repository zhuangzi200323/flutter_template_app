import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {

  String _theme = 'blue';
  String get value => _theme;

  void setTheme(color) async {
    _theme = color;
    print(_theme);
    notifyListeners();
  }
}