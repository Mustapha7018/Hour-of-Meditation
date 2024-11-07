// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/themes/hom_palette.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double dotSize;
  final double spacing;
  final Gradient activeColor;
  final Color inactiveColor;

  const StepProgressIndicator({
    super.key,
    required this.currentStep,
    required this.activeColor,
    required this.totalSteps,
    this.dotSize = 10,
    this.spacing = 8,
    this.inactiveColor = AppColor.greyscale300,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        bool isActive = index == currentStep;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: index < totalSteps - 1 ? spacing : 0),
          width: isActive ? dotSize * 4 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            gradient: isActive ? activeColor : null,
            color: isActive ? null : inactiveColor,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }
}
