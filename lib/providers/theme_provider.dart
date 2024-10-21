import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
   ThemeMode _themeMode=ThemeMode.light;
  ThemeMode get thememode=>_themeMode;
  bool get isDarkThemeEnabled=>thememode==ThemeMode.dark;
  set thememode(ThemeMode newThemeMode){
    _themeMode=newThemeMode;
    notifyListeners();
  }



}