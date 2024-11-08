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
        isChecked ? 'assets/icons/checked.png' : 'assets/icons/unchecked.png',
        width: 25,
        height: 25,
      ),
    );
  }
}
