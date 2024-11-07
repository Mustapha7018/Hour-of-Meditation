import 'package:flutter/material.dart';
import 'package:hom_app/features/auth/presentation/widgets/check_button.dart';
import 'package:hom_app/features/auth/presentation/widgets/radio_button.dart';
import '../../../../core/themes/font_styles.dart';
import '../../../../core/themes/hom_palette.dart';

class SelectableTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCheck;

  const SelectableTile({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isCheck = false, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: AppColor.primary200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isCheck
                ? CustomCheckButton(
                    isChecked: isSelected,
                    onChanged: (selected) => onTap(),
                  )
                : CustomRadioButton(
                    isSelected: isSelected,
                    onChanged: (selected) => onTap(),
                  ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: FontStyles.bodySemibold.copyWith(
                  color: AppColor.primary400,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
