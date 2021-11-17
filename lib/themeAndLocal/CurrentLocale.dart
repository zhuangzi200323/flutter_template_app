import 'package:flutter/cupertino.dart';

class CurrentLocale with ChangeNotifier {
  Locale _preLocale = const Locale('zh','CN');
  Locale _locale = const Locale('zh','CN');

  Locale get preValue => _preLocale;
  Locale get value => _locale;
  void setLocale(locale) {
    _preLocale = _locale;
    _locale = locale;
    notifyListeners();//通知依赖的Widget
  }
}