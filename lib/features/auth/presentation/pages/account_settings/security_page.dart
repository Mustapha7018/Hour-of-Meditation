import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../widgets/notification_settings_item.dart';

class SecurityScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SecurityScreen());
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool isRememberMeEnabled = true;
  bool isBiometricIDEnabled = true;
  bool isFaceIDEnabled = false;
  bool isSmsAuthenticatorEnabled = false;
  bool isGoogleAuthenticatorEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasBackButton: true,
        fieldText: 'Security',
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            NotificationSettingItem(
              text: "Remember me",
              isEnabled: isRememberMeEnabled,
              onChanged: (value) {
                setState(() {
                  isRememberMeEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "Biometric ID",
              isEnabled: isBiometricIDEnabled,
              onChanged: (value) {
                setState(() {
                  isBiometricIDEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "Face ID",
              isEnabled: isFaceIDEnabled,
              onChanged: (value) {
                setState(() {
                  isFaceIDEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "SMS Authenticator",
              isEnabled: isSmsAuthenticatorEnabled,
              onChanged: (value) {
                setState(() {
                  isSmsAuthenticatorEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "Google Authenticator",
              isEnabled: isGoogleAuthenticatorEnabled,
              onChanged: (value) {
                setState(() {
                  isGoogleAuthenticatorEnabled = value;
                });
              },
            ),
            const SizedBox(height: 32),
            CustomButton.elevated(
              iconTextSpacing: 12,
              text: 'Change Password',
              textStyle: FontStyles.bodySemibold
                  .copyWith(color: AppColor.primary400),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary100,
              onPressed: () {
                // Implement Change Password functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
