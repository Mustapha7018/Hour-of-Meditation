import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/core/themes/hom_palette.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../widgets/notification_settings_item.dart';


class NotificationScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const NotificationScreen());
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isMeditationTopicEnabled = true;
  bool _isSystemNotificationsEnabled = true;
  bool _isNewServicesEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        hasBackButton: true,
        fieldText: 'Notifications',
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notify me when...',
              style: FontStyles.heading4.copyWith(
                color: AppColor.primary400,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            NotificationSettingItem(
              text: "There's a New Meditation Topic",
              isEnabled: _isMeditationTopicEnabled,
              onChanged: (value) {
                setState(() {
                  _isMeditationTopicEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "Enable App System Notifications",
              isEnabled: _isSystemNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _isSystemNotificationsEnabled = value;
                });
              },
            ),
            NotificationSettingItem(
              text: "New Services Available",
              isEnabled: _isNewServicesEnabled,
              onChanged: (value) {
                setState(() {
                  _isNewServicesEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
