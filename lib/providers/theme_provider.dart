import 'package:flutter/material.dart';
import 'package:islamy_app/cashe/cash_data.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode appTheme;

  ThemeProvider({required ThemeMode initialAppTheme}) : appTheme = initialAppTheme;

  ThemeMode get myAppTheme => appTheme;

   Future<void> setAppTheme(ThemeMode newAppTheme) async {
    if (appTheme != newAppTheme) {
      appTheme = newAppTheme;
      await CashData.setData(key: "theme", value: appTheme == ThemeMode.dark ? "dark" : "light");
      notifyListeners();
    }
  }
}
