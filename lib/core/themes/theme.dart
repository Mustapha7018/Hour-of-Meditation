import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class AppTheme {
  static OutlineInputBorder _border([Color color = AppColor.greyscale500, double borderRadius = 16]) => 
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: color, width: 1.5),
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
      filled: true,
      fillColor: Colors.grey[800],
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      hintStyle: TextStyle(color: Colors.grey[500]),
      prefixIconColor: Colors.grey, 
      suffixIconColor: Colors.grey, 
      enabledBorder: _border(AppColor.greyscale500, 16),
      focusedBorder: _border(Colors.black, 20),
      border: _border(AppColor.greyscale500, 16),
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
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.grey[200],
    //   contentPadding: const EdgeInsets.symmetric(vertical: 16),
    //   hintStyle: TextStyle(color: Colors.grey[600]),
    //   prefixIconColor: Colors.grey, 
    //   suffixIconColor: Colors.grey, 
    //   enabledBorder: _border(AppColor.greyscale500, 16),
    //   focusedBorder: _border(Colors.black, 20),
    //   border: _border(AppColor.greyscale500, 16),
    // ),
  );
}
