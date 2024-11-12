import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hom_app/core/widgets/app_bar.dart';
import 'package:hom_app/core/widgets/display_card.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/bottom_navigation.dart';

class SingleSeriesPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SingleSeriesPage());
  const SingleSeriesPage({super.key});

  @override
  State<SingleSeriesPage> createState() => _SingleSeriesPageState();
}

class _SingleSeriesPageState extends State<SingleSeriesPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onCardTapped(int index) {
    debugPrint('Card $index tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: AppColor.white,
            title: CustomAppBar(
              hasBackButton: true,
              fieldText: 'Physical Healing (8 Sessions)',
            ),
          ),
          SliverPadding(
            padding: BodyPadding.medium,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 1,
                childAspectRatio: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _onCardTapped(index),
                    child: CustomCard(
                      title: 'Physical Healing',
                      titleStyle: FontStyles.bodyLarge.copyWith(
                        color: AppColor.primary400,
                      ),
                      description: 'Part ${index + 1}',
                      descriptionStyle: GoogleFonts.spaceMono(
                        textStyle: FontStyles.bodyMedium.copyWith(
                          color: AppColor.greyscale700,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      cardColor: AppColor.silver,
                    ),
                  );
                },
                childCount: 8, 
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
