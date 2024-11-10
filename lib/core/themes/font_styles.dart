import 'package:flutter/material.dart';

import 'hom_palette.dart';

class FontStyles {
  static const Color defaultColor = AppColor.greyscale900;

  // Heading Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1,
    color: defaultColor, 
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: defaultColor,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: defaultColor,
  );

  static const TextStyle heading3SemiBold = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: defaultColor,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: defaultColor,
  );

  // Body Styles
  static const TextStyle bodyXLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: defaultColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.6,
    color: defaultColor,
  );

  static const TextStyle bodySemibold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.6,
    color: defaultColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.5,
    color: defaultColor,
  );

  static const TextStyle bodyRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: defaultColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.4,
    color: defaultColor,
  );

  static const TextStyle bodyXSmall = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: defaultColor,
  );
}
