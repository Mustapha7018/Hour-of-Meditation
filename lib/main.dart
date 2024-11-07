import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/theme.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hour of Meditation',
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      home: Onboarding(),
    );
  }
}

