import 'package:flutter/material.dart';
import 'package:hom_app/core/widgets/buttons.dart';

import '../themes/font_styles.dart';
import '../themes/hom_palette.dart';

class CustomModal extends StatelessWidget {
  final String headText;
  final String message;
  final bool withButton;
  final VoidCallback? onButtonPressed;
  final String? buttonText;
  final String modalImage;

  const CustomModal({
    super.key,
    required this.headText,
    required this.message,
    this.withButton = false,
    this.onButtonPressed,
    this.buttonText,
    required this.modalImage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // User icon
            Image.asset(modalImage),
            const SizedBox(height: 20),

            // Head text
            Text(
              headText,
              style: FontStyles.heading4.copyWith(
                color: AppColor.primary500,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),

            // Message text
            Text(
              message,
              style: FontStyles.bodyRegular.copyWith(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Optional button
            if (withButton && buttonText != null)
              CustomButton.elevated(
                text: buttonText!,
                onPressed: onButtonPressed,
                width: double.infinity,
                colorFill: AppColor.primary500,
                textStyle: FontStyles.bodyLarge.copyWith(
                  color: AppColor.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
