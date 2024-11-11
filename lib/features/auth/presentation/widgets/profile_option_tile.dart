import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

import '../../../../core/themes/font_styles.dart';
import '../../../../core/widgets/circular_image.dart';

class ProfileOptionTile extends StatelessWidget {
  final String? imagePath; 
  final String label;
  final VoidCallback? onTap;

  const ProfileOptionTile({
    super.key,
    this.imagePath, 
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null && imagePath!.isNotEmpty)
              CircularImage(imagePath: imagePath!),
            if (imagePath != null && imagePath!.isNotEmpty)
              const SizedBox(width: 20),
            // Label
            Expanded(
              child: Text(
                label,
                style: FontStyles.heading4.copyWith(
                  color: AppColor.primary400,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            InkWell(
              child: Image.asset(
                'assets/icons/arrow_right.png',
              ),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
