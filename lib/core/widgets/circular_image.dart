import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class CircularImage extends StatelessWidget {
  final String imagePath;
  final double backgroundSize;
  final Color backgroundColor;
  final double imageWidth;

  const CircularImage({
    super.key,
    required this.imagePath,
    this.backgroundSize = 60,
    this.backgroundColor = AppColor.silver,
    this.imageWidth = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backgroundSize,
      height: backgroundSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: imageWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
