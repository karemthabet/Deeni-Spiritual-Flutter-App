import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = "en";

  String get selectedLanguage => _selectedLanguage;

  set selectedLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }
}
