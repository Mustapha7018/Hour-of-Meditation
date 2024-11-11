import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

import '../../../../core/themes/font_styles.dart';
import '../../../../core/widgets/switch_toggle.dart';

class NotificationSettingItem extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const NotificationSettingItem({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: FontStyles.heading4.copyWith(
              color: AppColor.primary400,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          CustomToggle(
            value: isEnabled,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
