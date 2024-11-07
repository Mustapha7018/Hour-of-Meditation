import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final bool isFilled;
  final bool withIcon;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? colorFill;
  final double iconTextSpacing;
  final bool isIconRight;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  // Main constructor
  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.isFilled = true,
    this.withIcon = false,
    this.width,
    this.height,
    this.colorFill,
    this.iconTextSpacing = 8.0,
    this.isIconRight = false,
    this.textStyle,
    this.borderRadius,
    this.boxShadow, 
    required this.onPressed,
  });

  // Elevated Button factory
  factory CustomButton.elevated({
    required String text,
    Widget? icon,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Color? colorFill,
    double iconTextSpacing = 8.0,
    bool isIconRight = false,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow, 
  }) {
    return CustomButton(
      text: text,
      icon: icon,
      isFilled: true,
      withIcon: icon != null,
      onPressed: onPressed ?? () {},
      width: width,
      height: height,
      colorFill: colorFill,
      iconTextSpacing: iconTextSpacing,
      isIconRight: isIconRight,
      textStyle: textStyle,
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      boxShadow: boxShadow,
    );
  }

  // Outlined Button factory
  factory CustomButton.outlined({
    required String text,
    Widget? icon,
    VoidCallback? onPressed,
    double? width,
    double? height,
    Color? colorFill,
    double iconTextSpacing = 8,
    bool isIconRight = false,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow, 
  }) {
    return CustomButton(
      text: text,
      icon: icon,
      isFilled: false,
      withIcon: icon != null,
      onPressed: onPressed ?? () {},
      width: width,
      height: height,
      colorFill: colorFill,
      iconTextSpacing: iconTextSpacing,
      isIconRight: isIconRight,
      textStyle: textStyle,
      borderRadius: borderRadius ?? BorderRadius.circular(50),
      boxShadow: boxShadow, // Pass shadow parameter
    );
  }

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(color: Colors.white);

    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.8,
      height: height ?? MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        boxShadow: boxShadow, 
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
      ),
      child: isFilled
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                ),
                backgroundColor: colorFill ?? Theme.of(context).primaryColor,
              ),
              onPressed: onPressed,
              child: _buildButtonContent(defaultTextStyle),
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                ),
                side: BorderSide(color: colorFill ?? Theme.of(context).primaryColor),
              ),
              onPressed: onPressed,
              child: _buildButtonContent(defaultTextStyle),
            ),
    );
  }

  // Helper method for button content
  Widget _buildButtonContent(TextStyle defaultTextStyle) {
    return withIcon && icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: isIconRight
                ? [
                    Text(text, style: textStyle ?? defaultTextStyle),
                    SizedBox(width: iconTextSpacing),
                    icon!,
                  ]
                : [
                    icon!,
                    SizedBox(width: iconTextSpacing),
                    Text(text, style: textStyle ?? defaultTextStyle),
                  ],
          )
        : Text(
            text,
            style: textStyle ?? defaultTextStyle,
          );
  }
}
