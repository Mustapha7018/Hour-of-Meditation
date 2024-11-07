import 'package:flutter/material.dart';

class CustomCheckButton extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckButton({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Image.asset(
        isChecked ? 'assets/images/checked.png' : 'assets/images/unchecked.png',
        width: 25,
        height: 25,
      ),
    );
  }
}
