import 'package:flutter/material.dart';
import 'package:islamy_app/Ui/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      dividerTheme: const DividerThemeData(
        thickness: 2,
        color: AppColors.primaryLightMode,
      ),
////////////////////////////////////////////////////////

      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryLightMode,
          onPrimary: Colors.white,
          secondary: AppColors.black,
          onSecondary: AppColors.black,
          error: AppColors.primaryLightMode,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.white),

      /////////////////////////////////////////////////
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: "JF Flat",
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
          titleSmall: TextStyle(
              fontFamily: "JF Flat",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.black),
          titleMedium: TextStyle(
              fontFamily: "ElMessiri",
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: AppColors.black)),
      //////////////////////////////////////
      canvasColor: AppColors.primaryLightMode,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          backgroundColor: AppColors.primaryLightMode,
          selectedItemColor: AppColors.black,
          unselectedItemColor: Colors.white),
      //////////////////////////////////////////////
      appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.black,
          iconTheme: IconThemeData(color: Colors.red),
          titleTextStyle: TextStyle(
              fontFamily: "JF Flat",
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: AppColors.black),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0),
      ////////////////////////////////////////
      primaryColor: AppColors.primaryLightMode,
      scaffoldBackgroundColor: Colors.transparent);

  ///////////////////////////////////////////////////////

  static ThemeData darkTheme = ThemeData(
      dividerTheme: const DividerThemeData(
        thickness: 2,
        color: AppColors.goldDarkMode,
      ),
      dividerColor: AppColors.goldDarkMode,
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primaryDarkMode,
          onPrimary: AppColors.primaryDarkMode,
          secondary: Colors.white,
          onSecondary: AppColors.goldDarkMode,
          error: AppColors.goldDarkMode,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: AppColors.primaryDarkMode),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontFamily: "JF Flat",
              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: AppColors.goldDarkMode),
          titleSmall: TextStyle(
              fontFamily: "JF Flat",
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.goldDarkMode),
          titleMedium: TextStyle(
  fontFamily: "ElMessiri",              fontSize: 25,
              fontWeight: FontWeight.w400,
              color: Colors.white)),
      canvasColor: AppColors.primaryDarkMode,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          backgroundColor: AppColors.primaryDarkMode,
          selectedItemColor: AppColors.goldDarkMode,
          unselectedItemColor: Colors.white),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
              fontFamily: "JF Flat",
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Colors.white),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0),
      primaryColor: AppColors.primaryDarkMode,
      scaffoldBackgroundColor: Colors.transparent);
}
