import 'package:flutter/material.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/account_page.dart';
import 'package:hom_app/features/auth/presentation/pages/main/analytics_page.dart';
import 'package:hom_app/features/auth/presentation/pages/main/declare_page.dart';
import 'package:hom_app/features/auth/presentation/pages/main/home_page.dart';

import '../../../../../core/widgets/bottom_navigation.dart';

class HomeScreens extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreens());
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),       
    const DeclareScreen(),    
    const AnalyticsScreen(),  
    const AccountScreen(),    
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
