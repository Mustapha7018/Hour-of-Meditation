import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class CustomToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColor.white,
      activeTrackColor: AppColor.primary400,
      inactiveThumbColor: AppColor.white,
      inactiveTrackColor: AppColor.greyscale200,
      trackOutlineWidth: const WidgetStatePropertyAll(0),
    );
  }
}
