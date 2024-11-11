import 'package:flutter/material.dart';

import '../themes/font_styles.dart';
import '../themes/hom_palette.dart';

class BigText extends StatelessWidget {
  final double fontSize;
  const BigText({super.key, this.fontSize = 250});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'HOM',
        style: FontStyles.heading1.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          fontFamily: 'Porto',
          color: AppColor.primary400,
        ),
      ),
    );
  }
}
