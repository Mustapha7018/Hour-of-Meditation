import 'package:flutter/material.dart';

import '../../../../core/themes/hom_palette.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; 

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 12,
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: AppColor.greyscale200,
        color: AppColor.primary500, 
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
