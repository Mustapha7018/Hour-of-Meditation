import 'package:flutter/material.dart';

import '../themes/font_styles.dart';
import '../themes/hom_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String fieldText;
  // final Image? leftIcon;
  final Image? rightIcon1;
  final Image? rightIcon2;
  final bool hasBackButton;
  final VoidCallback? onLeftIconPressed;
  final VoidCallback? onRightIcon1Pressed;
  final VoidCallback? onRightIcon2Pressed;

  const CustomAppBar({
    super.key,
    required this.fieldText,
    // this.leftIcon,
    this.rightIcon1,
    this.rightIcon2,
    this.onLeftIconPressed,
    this.onRightIcon1Pressed,
    this.onRightIcon2Pressed,
    this.hasBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          if (hasBackButton) InkWell(
          child: Image.asset('assets/icons/left_arrow.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ), 
          if (!hasBackButton)
            Image.asset('assets/icons/sphere.png'),
          const SizedBox(width: 12),
          Text(
            fieldText,
            style: FontStyles.heading4.copyWith(
              color: AppColor.primary400,
              fontWeight: FontWeight.w400,
            )
          ),
        ],
      ),
      actions: [
        if (rightIcon1 != null) // First action icon on the right
          InkWell(
          onTap: onRightIcon1Pressed,
          child: rightIcon1,
        ),
        const SizedBox(width: 20,),
        if (rightIcon2 != null) // Second action icon on the right
          InkWell(
          onTap: onRightIcon2Pressed,
          child: rightIcon2,
        ),
        SizedBox(width: rightIcon2 != null ? 0 : 15)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
