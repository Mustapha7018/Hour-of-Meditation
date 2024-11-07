import 'package:flutter/material.dart';

import '../../../../core/themes/font_styles.dart';
import '../../../../core/themes/hom_palette.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final String label;
  final double size;
  final ValueChanged<bool> onChanged;

  const CustomRadioButton({
    super.key,
    required this.isSelected,
    required this.onChanged,
    this.selectedColor = AppColor.primary400, 
    this.unselectedColor = AppColor.primary400,
    this.label = '',
    this.size = 27,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(3), 
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? selectedColor : unselectedColor,
                width: 4,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? selectedColor : AppColor.transparent,
              ),
            ),
          ),
          const SizedBox(width: 12), 
          Text(
            label,
            style: FontStyles.bodySemibold.copyWith(
              fontSize: 18
            )
          ),
        ],
      ),
    );
  }
}
