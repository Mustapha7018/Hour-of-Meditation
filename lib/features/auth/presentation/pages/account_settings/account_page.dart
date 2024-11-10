import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../widgets/profile_option_tile.dart';

class AccountScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AccountScreen());

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: false,
        fieldText: 'Account',
        rightIcon1: Image.asset('assets/icons/more.png'),
        onRightIcon1Pressed: () {
          // Action for the more icon
        },
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          children: [
            Row(
              children: [
                // Profile Image
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/person.png'),
                ),
                const SizedBox(width: 12),

                // Name and Email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emmanuel Adewusi',
                        style: FontStyles.heading4.copyWith(
                          color: AppColor.primary400,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'emmanuel.adewusi@cccghq.org',
                        style: FontStyles.bodyMedium.copyWith(
                          color: AppColor.greyscale800,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit Icon
                InkWell(
                  child: Image.asset('assets/icons/edit.png'),
                  onTap: () {},
                ),
              ],
            ),
            const Divider(
              height: 30,
              color: AppColor.greyscale200,
            ),
            const SizedBox(
              height: 24,
            ),
            ProfileOptionTile(
              label: 'Personal Info',
              imagePath: 'assets/images/user.png',
              onTap: () {},
            ),
            ProfileOptionTile(
              label: 'Notification',
              imagePath: 'assets/icons/bell_filled.png',
              onTap: () {},
            ),
            ProfileOptionTile(
              label: 'Security',
              imagePath: 'assets/icons/shield_filled.png',
              onTap: () {},
            ),
            const Divider(
              height: 40,
              color: AppColor.greyscale200,
            ),
                        ProfileOptionTile(
              label: 'Help Center',
              imagePath: 'assets/icons/file_filled.png',
              onTap: () {},
            ),
            ProfileOptionTile(
              label: 'About Hour Of Meditation',
              imagePath: 'assets/icons/info_filled.png',
              onTap: () {},
            ),
            ProfileOptionTile(
              label: 'Logout',
              imagePath: 'assets/icons/logout_filled.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
