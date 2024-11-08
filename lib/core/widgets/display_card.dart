import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

import '../themes/font_styles.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? elevation;
  final Color? cardColor;
  final BoxShadow? boxShadow;
  final Widget? image;

  const CustomCard({
    super.key,
    required this.title,
    required this.description,
    this.elevation,
    this.boxShadow,
    this.image,
    this.cardColor,
    this.titleStyle,
    this.descriptionStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.transparent,
      elevation: elevation ?? 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: AppColor.greyscale700.withOpacity(0.2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cardColor ?? AppColor.primary200,
          boxShadow: boxShadow != null ? [boxShadow!] : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Content Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? FontStyles.heading4.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: AppColor.primary200,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: descriptionStyle ?? FontStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.primary100,
                    ),
                  ),
                ],
              ),
            ),
            // Optional Image
            if (image != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: image,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
