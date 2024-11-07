import 'package:flutter/material.dart';
import '../../../../core/themes/font_styles.dart';
import '../../../../core/themes/hom_palette.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final String? hintText;
  final IconData? icon;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool isPassword;
  final TextStyle? hintStyle;

  const CustomInputField({
    super.key,
    required this.label,
    this.initialValue,
    this.hintText,
    this.icon,
    this.readOnly = false,
    this.onTap,
    this.isPassword = false,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label text
        Text(
          label,
          style: FontStyles.bodyRegular.copyWith(
            color: AppColor.greyscale900,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),

        // Input field container
        TextFormField(
          initialValue: initialValue,
          readOnly: readOnly,
          obscureText: isPassword,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? const TextStyle(
              color: AppColor.greyscale900,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: icon != null
                ? Icon(
                    icon,
                    color: AppColor.greyscale900,
                  )
                : null,
            isDense: true,
            contentPadding: const EdgeInsets.only(bottom: 8),
            fillColor: Colors.transparent,
            filled: false,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primary400,
                width: 1.5,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.primary500,
                width: 1.5,
              ),
            ),
          ),
          style: const TextStyle(
            color: AppColor.greyscale900,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
