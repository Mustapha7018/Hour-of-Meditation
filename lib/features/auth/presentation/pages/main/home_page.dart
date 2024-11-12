import 'package:flutter/material.dart';
import 'package:hom_app/core/widgets/app_bar.dart';
import 'package:hom_app/core/widgets/display_card.dart';
import 'package:hom_app/features/auth/presentation/pages/main/explore_series.dart';
import 'package:hom_app/features/auth/presentation/pages/main/search_screen.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: AppColor.white,
            title: CustomAppBar(
              hasBackButton: false,
              fieldText: 'Hello, Dr. Adewusi',
              rightIcon1: Image.asset('assets/icons/search.png'),
              rightIcon2: Image.asset('assets/icons/bell.png'),
              onRightIcon1Pressed: () {
                Navigator.push(context, SearchScreen.route());
              },
            ),
          ),
          SliverPadding(
            padding: BodyPadding.medium,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CustomCard(
                    title: 'Welcome HoM',
                    description: 'Get connected with God and yourself on a deeper level.',
                    image: Image.asset('assets/images/square.png'),
                    cardColor: AppColor.primary400,
                  ),
                  const SizedBox(height: 28),
                  CustomCard(
                    title: 'Watch HoM Live',
                    titleStyle: FontStyles.bodyMedium.copyWith(
                      fontSize: 20,
                      color: AppColor.primary400,
                    ),
                    description: 'Every Saturday at 9AM MST',
                    descriptionStyle: FontStyles.bodyMedium.copyWith(
                      color: AppColor.greyscale700,
                      fontWeight: FontWeight.normal,
                    ),
                    elevation: 0,
                    boxShadow: BoxShadow(
                      color: AppColor.greyscale700.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore by Series',
                        style: FontStyles.heading4.copyWith(
                          color: AppColor.primary400,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, ExploreSeries.route());
                        },
                        child: Image.asset('assets/icons/right_arrow.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomCard(
                    title: 'Physical Healing',
                    titleStyle: FontStyles.bodyMedium.copyWith(
                      fontSize: 20,
                      color: AppColor.primary400,
                    ),
                    description: 'Experience divine healing in your physical body.',
                    descriptionStyle: FontStyles.bodyMedium.copyWith(
                      color: AppColor.greyscale700,
                      fontWeight: FontWeight.normal,
                    ),
                    elevation: 0,
                    boxShadow: BoxShadow(
                      color: AppColor.greyscale700.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                    image: Image.asset('assets/images/square.png'),
                  ),
                  const SizedBox(height: 20),
                  CustomCard(
                    title: 'Divine Favour',
                    titleStyle: FontStyles.bodyMedium.copyWith(
                      fontSize: 20,
                      color: AppColor.primary400,
                    ),
                    description: 'Favour is the next step you need. Step into that reality with this series.',
                    descriptionStyle: FontStyles.bodyMedium.copyWith(
                      color: AppColor.greyscale700,
                      fontWeight: FontWeight.normal,
                    ),
                    elevation: 0,
                    boxShadow: BoxShadow(
                      color: AppColor.greyscale700.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                    image: Image.asset('assets/images/drop.png'),
                  ),
                  const SizedBox(height: 20),
                  CustomCard(
                    title: 'Divine Secrets',
                    titleStyle: FontStyles.bodyMedium.copyWith(
                      fontSize: 20,
                      color: AppColor.primary400,
                    ),
                    description: 'Favour is the next step you need. Step into that reality with this series.',
                    descriptionStyle: FontStyles.bodyMedium.copyWith(
                      color: AppColor.greyscale700,
                      fontWeight: FontWeight.normal,
                    ),
                    elevation: 0,
                    boxShadow: BoxShadow(
                      color: AppColor.greyscale700.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                    image: Image.asset('assets/images/drop.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
