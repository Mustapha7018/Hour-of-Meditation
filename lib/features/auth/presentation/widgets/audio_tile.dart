import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class CustomAudioTile extends StatelessWidget {
  final String title;
  final String duration;
  final VoidCallback onTap;

  const CustomAudioTile({
    super.key,
    required this.title,
    required this.duration,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Audio icon image
            Image.asset(
              'assets/images/audio_play.png',
              width: 55,
              height: 55,
            ),
            const SizedBox(width: 16),

            // Title and duration
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontStyles.bodyLarge.copyWith(
                    color: AppColor.primary400,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: FontStyles.bodyMedium.copyWith(
                    color: AppColor.greyscale700,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
