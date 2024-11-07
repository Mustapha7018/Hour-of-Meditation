import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import 'dart:async';

import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller and the scaling animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();  // Start the animation

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        GetStartedScreen.route(),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Text(
              'HOM',
              style: FontStyles.heading1.copyWith(
                fontSize: 250,
                fontWeight: FontWeight.normal,
                fontFamily: 'Porto',
                color: AppColor.primary400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

