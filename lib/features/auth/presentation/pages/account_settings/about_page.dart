import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import 'package:hom_app/core/widgets/big_text.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../widgets/profile_option_tile.dart';

class AboutScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AboutScreen());
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        hasBackButton: true,
        fieldText: 'About Hour Of Meditation',
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            BigText(
              fontSize: 180,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'HoM v1.0',
                style: FontStyles.heading4,
              ),
            ),
            Divider(
              height: 50,
              color: AppColor.greyscale200,
            ),
            ProfileOptionTile(
              label: 'Privacy Policy',
            ),
            ProfileOptionTile(
              label: 'Feedback',
            ),
            ProfileOptionTile(
              label: 'Rate Us',
            ),
            ProfileOptionTile(
              label: 'Visit Our Website',
            ),
            ProfileOptionTile(
              label: 'Follow Us On Social Media',
            ),
          ],
        ),
      ),
    );
  }
}
