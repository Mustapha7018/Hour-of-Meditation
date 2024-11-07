import 'package:flutter/material.dart';
import 'package:hom_app/features/auth/presentation/pages/main/home_page.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding1.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding2.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding3.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding4.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding5.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding6.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding7.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding8.dart';

class Onboarding extends StatelessWidget {
  final PageController _pageController = PageController();

  Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          SplashScreen(),
          GetStartedScreen(),
          ChooseGenderScreen(),
          ChooseAgeScreen(),
          MeditationGoalScreen(),
          MeditationDurationScreen(),
          CompleteProfileScreen(),
          CreateAccountScreen(),
          HomePage(),
        ],
      ),
    );
  }
}
