import 'package:flutter/material.dart';

import '../themes/font_styles.dart';
import '../themes/hom_palette.dart';

class CustomAccordion extends StatelessWidget {
  final String title;
  final String content;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Color? dividerColor;
  final double borderRadius;

  const CustomAccordion({
    super.key,
    required this.title,
    required this.content,
    this.backgroundColor,
    this.titleStyle,
    this.contentStyle,
    this.dividerColor,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.silver,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            title,
            style: titleStyle ??
                FontStyles.bodyLarge.copyWith(
                  color: AppColor.primary400
                ),
          ),
          trailing: Image.asset('assets/icons/arrow_down.png'),
          children: [
            Divider(
              color: dividerColor ?? AppColor.greyscale200,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                content,
                style: contentStyle ??
                    FontStyles.bodyMedium.copyWith(
                      color: AppColor.greyscale800,
                      fontWeight: FontWeight.normal
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
