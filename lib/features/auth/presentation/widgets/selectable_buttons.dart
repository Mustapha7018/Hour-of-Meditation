import 'package:flutter/material.dart';

import '../../../../core/themes/font_styles.dart';
import '../../../../core/themes/hom_palette.dart';

class SelectableButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary400 : AppColor.transparent,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColor.primary400,
                  width: 2,
                ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          textAlign: TextAlign.center,
          label,
          style: FontStyles.bodyLarge.copyWith(
            color: isSelected ? AppColor.primary200 : AppColor.primary400,
          ),
        ),
      ),
    );
  }
}
