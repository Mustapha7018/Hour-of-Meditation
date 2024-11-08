import 'package:flutter/material.dart';

import '../themes/hom_palette.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( 
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(color: AppColor.greyscale200),
        ),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
      ),
      child: Image.asset(
        assetPath,
        height: 24,
      ),
    );
  }
}
