import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class AppTheme {
  static OutlineInputBorder _border([Color color = AppColor.greyscale500]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  // Dark Theme
  static final ThemeData darkThemeMode = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.greyscale500,
    fontFamily: 'NeueHaasDisplay',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      filled: true,
      fillColor: Colors.grey[800], // Dark theme fill color
      hintStyle: TextStyle(color: Colors.grey[500]),
      enabledBorder: _border(),
      focusedBorder: _border(AppColor.greyscale500),
    ),
  );

  // Light Theme
  static final ThemeData lightThemeMode = ThemeData(
    brightness: Brightness.light,
    canvasColor: AppColor.white,
    primaryColor: AppColor.greyscale500,
    fontFamily: 'NeueHaasDisplay',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColor.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      filled: true,
      fillColor: Colors.grey[200], // Light theme fill color
      hintStyle: TextStyle(color: Colors.grey[600]),
      enabledBorder: _border(),
      focusedBorder: _border(AppColor.greyscale500),
    ),
  );
}
