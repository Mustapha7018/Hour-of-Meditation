import 'package:flutter/material.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding3.dart';
import 'package:hom_app/features/auth/presentation/pages/sign_in/sign_in.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../widgets/step_progress_indicator.dart';

class GetStartedScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const GetStartedScreen());
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary200,
      body: Padding(
        padding: BodyPadding.medium,
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/sphere.png'),

              const SizedBox(
                height: 30,
              ),
              Text(
                'Hour Of\nMeditation',
                textAlign: TextAlign.center,
                style: FontStyles.heading1.copyWith(
                  color: AppColor.primary400,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Discover the profound impact of guided Christian meditation. Welcome HoM.',
                textAlign: TextAlign.center,
                style: FontStyles.bodyXLarge.copyWith(
                  color: AppColor.primary400,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const StepProgressIndicator(
                currentStep: 0,
                totalSteps: 5,
                dotSize: 8,
                spacing: 6,
                activeColor: AppColor.gradientPrimary,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton.elevated(
                icon: Image.asset('assets/images/google_img.png'),
                iconTextSpacing: 12,
                text: 'Continue with Google',
                textStyle: FontStyles.bodySemibold
                    .copyWith(color: AppColor.greyscale900),
                height: 60,
                width: double.infinity,
                colorFill: AppColor.white,
                onPressed: () {
                  Navigator.push(context, ChooseGenderScreen.route());
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton.elevated(
                text: 'Get started',
                textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
                height: 60,
                width: double.infinity,
                colorFill: AppColor.primary300,
                onPressed: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, SignInScreen.route());
                },
                child: const Text(
                  'I Already Have an Account',
                  style: FontStyles.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
