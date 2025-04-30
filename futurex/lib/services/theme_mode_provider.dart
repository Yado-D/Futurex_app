

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDark = false;

  get themeMode => _themeMode;
  get isDark => _isDark;

  // set setThemeMode(bool value)=> _isDark =  value;

  toggleTheme(){
    _isDark=!_isDark;
    _themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}