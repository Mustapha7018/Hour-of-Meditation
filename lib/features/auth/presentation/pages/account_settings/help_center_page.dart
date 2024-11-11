import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/core/widgets/search_field.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/expansion_tile.dart';

class HelpCenterScreen extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => const HelpCenterScreen());

  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          hasBackButton: true,
          fieldText: 'Help Center',
        ),
        body: Column(
          children: [
            TabBar(
              labelStyle: FontStyles.bodyXLarge.copyWith(color: AppColor.primary500),
              unselectedLabelStyle: FontStyles.bodyXLarge.copyWith(color: AppColor.greyscale500),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: AppColor.primary500, width: 4),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                insets: EdgeInsets.symmetric(horizontal: 120),
              ),
              tabs: const [
                Tab(text: 'FAQ'),
                Tab(text: 'Contact us'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const Padding(
                    padding: BodyPadding.medium,
                    child: Column(
                      children: [
                        CustomSearchField(),
                        SizedBox(height: 18),
                        Expanded(child: FAQList()), 
                      ],
                    ),
                  ),
                  Padding(
                    padding: BodyPadding.medium,
                    child: Column(
                      children: [
                        _buildContactOption(
                          image: 'assets/icons/mic.png',
                          label: 'Customer Service',
                          onTap: () {},
                        ),
                        const SizedBox(height: 16),
                        _buildContactOption(
                          image: 'assets/icons/web.png',
                          label: 'Website',
                          onTap: () {},
                        ),
                        const SizedBox(height: 16),
                        _buildContactOption(
                          image: 'assets/icons/instagram.png',
                          label: 'Instagram',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactOption({
    required String image,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: AppColor.silver,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(width: 16),
            Text(
              label,
              style: FontStyles.bodyXLarge.copyWith(color: AppColor.primary400),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQList extends StatelessWidget {
  const FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    final faqData = [
      {
        "title": "What is HoM?",
        "content": "In late 2023, Hour of Meditation was launched to introduce more people to the limitless and scriptural benefits of meditation. At HoM, we take you on a journey of being connected with God and yourself on a deeper level through meditation."
      },
      {
        "title": "How is HoM different from other forms of meditation?",
        "content": "HoM focuses on scriptural meditation, which emphasizes spiritual connection."
      },
      {
        "title": "Is meditation compatible with Christian beliefs?",
        "content": "Yes, HoM aims to integrate meditation within Christian beliefs, focusing on scripture."
      },
      {
        "title": "When is the best time to meditate?",
        "content": "Morning and evening are often considered the best times to meditate."
      },
      {
        "title": "Is it okay to fall asleep while I am meditating?",
        "content": "It's natural to fall asleep, but the aim is to stay present and aware."
      },
    ];

    return ListView.builder(
      itemCount: faqData.length,
      itemBuilder: (context, index) {
        return CustomAccordion(
          title: faqData[index]["title"]!,
          content: faqData[index]["content"]!,
        );
      },
    );
  }
}
