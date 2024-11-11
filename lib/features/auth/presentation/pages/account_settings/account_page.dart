import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/about_page.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/help_center_page.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/notification_page.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/personal_info_screen.dart';
import 'package:hom_app/features/auth/presentation/pages/account_settings/security_page.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/buttons.dart';
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
              onTap: () {
                Navigator.push(context, PersonalInfoScreen.route());
              },
            ),
            ProfileOptionTile(
              label: 'Notification',
              imagePath: 'assets/icons/bell_filled.png',
              onTap: () {
                Navigator.push(context, NotificationScreen.route());
              },
            ),
            ProfileOptionTile(
              label: 'Security',
              imagePath: 'assets/icons/shield_filled.png',
              onTap: () {
                Navigator.push(context, SecurityScreen.route());
              },
            ),
            const Divider(
              height: 40,
              color: AppColor.greyscale200,
            ),
            ProfileOptionTile(
              label: 'Help Center',
              imagePath: 'assets/icons/file_filled.png',
              onTap: () {
                Navigator.push(context, HelpCenterScreen.route());
              },
            ),
            ProfileOptionTile(
              label: 'About Hour Of Meditation',
              imagePath: 'assets/icons/info_filled.png',
              onTap: () {
                Navigator.push(context, AboutScreen.route());
              },
            ),
            ProfileOptionTile(
              label: 'Logout',
              imagePath: 'assets/icons/logout_filled.png',
              onTap: () {
                _showLogoutConfirmation(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 3,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColor.greyscale300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                // Title
                const Text(
                  'Logout',
                  style: FontStyles.heading4,
                ),
                // const SizedBox(height: 8),
                const Divider(
                  height: 40,
                  color: AppColor.greyscale200,
                ),
                // Confirmation message
                Text(
                  'Are you sure you want to log out?',
                  style: FontStyles.bodyMedium.copyWith(
                    color: AppColor.greyscale800,
                  ),
                ),
                const SizedBox(height: 25),
                // Buttons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomButton.elevated(
                        iconTextSpacing: 12,
                        text: 'Cancel',
                        textStyle: FontStyles.bodySemibold.copyWith(
                          color: AppColor.greyscale900,
                        ),
                        height: 60,
                        colorFill: AppColor.primary100,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Logout Button with equal width
                    Expanded(
                      child: CustomButton.elevated(
                        text: 'Yes, Logout',
                        textStyle: FontStyles.bodyLarge.copyWith(
                          color: AppColor.white,
                        ),
                        height: 60,
                        colorFill: AppColor.primary300,
                        onPressed: () {
                          Navigator.pop(context);
                          // Perform logout action
                        },
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.greyscale900.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
