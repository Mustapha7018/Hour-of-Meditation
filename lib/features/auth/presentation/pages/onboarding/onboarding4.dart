import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding5.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../widgets/linear_progress_indicator.dart';
import '../../widgets/selectable_buttons.dart';

class ChooseAgeScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ChooseAgeScreen());
  const ChooseAgeScreen({super.key});

  @override
  State<ChooseAgeScreen> createState() => _ChooseAgeScreenState();
}

class _ChooseAgeScreenState extends State<ChooseAgeScreen> {
  int selectedIndex = -1;
  int selectedAgeIndex = -1; 

  final List<String> ageRanges = [
    "14 - 17",
    "18 - 24",
    "25 - 29",
    "30 - 34",
    "35 - 39",
    "40 - 44",
    "45 - 49",
    "≥ 50",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: InkWell(
          child: Image.asset('assets/icons/left_arrow.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomProgressBar(progress: 0.4),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Your Age',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Select from the options below.',
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 3,
                children: List.generate(ageRanges.length, (index) {
                  return SizedBox(
                    child: SelectableButton(
                      label: ageRanges[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index; 
                        });
                      },
                    ),
                  );
                }),
              ),
            ),
            // const Spacer(flex: 15),
            CustomButton.elevated(
              text: 'Continue',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                Navigator.push(context, MeditationGoalScreen.route());
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
