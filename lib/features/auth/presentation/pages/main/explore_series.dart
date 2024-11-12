import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hom_app/core/widgets/app_bar.dart';
import 'package:hom_app/core/widgets/display_card.dart';
import 'package:hom_app/features/auth/presentation/pages/main/single_series_page.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/bottom_navigation.dart';

class ExploreSeries extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ExploreSeries());
  const ExploreSeries({super.key});

  @override
  State<ExploreSeries> createState() => _ExploreSeriesState();
}

class _ExploreSeriesState extends State<ExploreSeries> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
              fieldText: 'Explore Series',
            ),
          ),
          SliverPadding(
            padding: BodyPadding.medium,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, SingleSeriesPage.route());
                    },
                    child: CustomCard(
                      title: 'Physical Healing',
                      titleStyle: FontStyles.bodyLarge.copyWith(
                        color: AppColor.primary400,
                      ),
                      description: '8 SESSIONS',
                      descriptionStyle: GoogleFonts.spaceMono(
                        textStyle: FontStyles.bodySmall.copyWith(
                          color: AppColor.greyscale700,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      cardColor: AppColor.silver,
                    ),
                  );
                },
                childCount: 14, 
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
