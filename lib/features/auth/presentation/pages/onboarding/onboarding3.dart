import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding4.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../widgets/linear_progress_indicator.dart';
import '../../widgets/radio_button.dart';

class ChooseGenderScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ChooseGenderScreen());
  const ChooseGenderScreen({super.key});

  @override
  State<ChooseGenderScreen> createState() => _ChooseGenderScreenState();
}

class _ChooseGenderScreenState extends State<ChooseGenderScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: InkWell(
          child: Image.asset('assets/images/left_arrow.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomProgressBar(progress: 0.2),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your gender?',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Select from the options below.',
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(height: 30),
            CustomRadioButton(
              isSelected: selectedIndex == 0,
              onChanged: (isSelected) {
                setState(() {
                  selectedIndex = 0;
                });
              },
              label: "I am a male",
            ),
            const SizedBox(height: 30),
            const Divider(height: 1),
            const SizedBox(height: 30),
            CustomRadioButton(
              isSelected: selectedIndex == 1,
              onChanged: (isSelected) {
                setState(() {
                  selectedIndex = 1;
                });
              },
              label: "I am female",
            ),
            const SizedBox(height: 35),
            const Divider(height: 1),
            const SizedBox(height: 35),
            CustomRadioButton(
              isSelected: selectedIndex == 2,
              onChanged: (isSelected) {
                setState(() {
                  selectedIndex = 2;
                });
              },
              label: "Rather not say",
            ),
            const Spacer(flex: 15),
            CustomButton.elevated(
              text: 'Continue',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                Navigator.push(context, ChooseAgeScreen.route());
              },
              boxShadow: [
                BoxShadow(
                  color: AppColor.greyscale900.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
