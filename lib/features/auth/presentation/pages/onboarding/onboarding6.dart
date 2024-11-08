import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding7.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../widgets/linear_progress_indicator.dart';
import '../../widgets/selectable_tile.dart'; 

class MeditationDurationScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MeditationDurationScreen());
  const MeditationDurationScreen({super.key});

  @override
  State<MeditationDurationScreen> createState() => _MeditationDurationScreenState();
}

class _MeditationDurationScreenState extends State<MeditationDurationScreen> {
  final List<String> goals = [
    'Less than 15 minutes / day',
    'Between 15 - 30 minutes / day',
    'Between 30 - 60 minutes / day',
    'More than 60 minutes / day',
    "I haven't decided yet",
  ];

  final Map<String, bool> selectedGoals = {};

  @override
  void initState() {
    super.initState();
    for (var goal in goals) {
      selectedGoals[goal] = false;
    }
  }

  void toggleSelection(String goal) {
    setState(() {
      selectedGoals.updateAll((key, value) => key == goal);
    });
  }

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
        title: const CustomProgressBar(progress: 0.8),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How Long Do You Want to Spend in Meditation?',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Choose from the options below.',
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return SelectableTile(
                    label: goal,
                    isSelected: selectedGoals[goal]!,
                    isCheck: false,
                    onTap: () => toggleSelection(goal),
                  );
                },
              ),
            ),
            CustomButton.elevated(
              text: 'Continue',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                Navigator.push(context, CompleteProfileScreen.route());
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
