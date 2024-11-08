import 'package:flutter/material.dart';
import '../../../../../core/themes/hom_palette.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      onTap: onTap,
      // backgroundColor: AppColor.white,
      selectedItemColor: AppColor.primary400,
      unselectedItemColor: AppColor.greyscale500,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          // backgroundColor: Colors.white,
          icon: Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Image.asset(
              currentIndex == 0
                  ? 'assets/icons/home_active.png'
                  : 'assets/icons/home.png',
            ),
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              currentIndex == 1
                  ? 'assets/icons/audio_active.png'
                  : 'assets/icons/audio.png',
            ),
          ),
          label: 'DECLARE',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              currentIndex == 2
                  ? 'assets/icons/analytics_active.png'
                  : 'assets/icons/analytics.png',
            ),
          ),
          label: 'ANALYTICS',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              currentIndex == 3
                  ? 'assets/icons/account_active.png'
                  : 'assets/icons/account.png',
            ),
          ),
          label: 'ACCOUNT',
        ),
      ],
    );
  }
}
