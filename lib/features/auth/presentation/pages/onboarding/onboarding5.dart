import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding6.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../widgets/linear_progress_indicator.dart';
import '../../widgets/selectable_tile.dart';

class MeditationGoalScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const MeditationGoalScreen());
  const MeditationGoalScreen({super.key});

  @override
  State<MeditationGoalScreen> createState() => _MeditationGoalScreenState();
}

class _MeditationGoalScreenState extends State<MeditationGoalScreen> {
  final List<String> goals = [
    'Mental (Anxiety, Focus, etc.)',
    'Emotional (Regulation, etc.)',
    'Physical (Athletics, Fitness, etc.)',
    'Spiritual (Intimacy With Jesus, Reading The Word, etc.)',
    'General (Visualization, Quietness)',
    'Not sure/nothing specific yet',
  ];

  final Map<String, bool> selectedGoals = {};

  @override
  void initState() {
    super.initState();
    // Initialize all goals as unselected
    for (var goal in goals) {
      selectedGoals[goal] = false;
    }
  }

  void toggleSelection(String goal) {
    setState(() {
      selectedGoals[goal] = !selectedGoals[goal]!;
    });
  }

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
        title: const CustomProgressBar(progress: 0.6),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are your goals with Christian Meditation?',
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
                    isCheck: true,
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
                Navigator.push(context, MeditationDurationScreen.route());
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