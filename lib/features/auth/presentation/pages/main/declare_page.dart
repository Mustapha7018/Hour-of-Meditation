import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/body_padding.dart';
import 'package:hom_app/core/widgets/app_bar.dart';
import 'package:hom_app/features/auth/presentation/pages/main/audio_play_screen.dart';
import 'package:hom_app/features/auth/presentation/pages/main/congratulation_page.dart';
import '../../widgets/audio_tile.dart';

class DeclareScreen extends StatelessWidget {
  const DeclareScreen({super.key});

  // Sample data for the audio items
  final List<Map<String, String>> audioItems = const [
    {"title": "Intro", "duration": "3 min"},
    {"title": "I Am Powerful", "duration": "3 min"},
    {"title": "I Am Prosperous", "duration": "3 min"},
    {"title": "I Am Wise", "duration": "3 min"},
    {"title": "I Am Healthy", "duration": "3 min"},
    {"title": "I Am Honoured", "duration": "3 min"},
    {"title": "I Am Glorious", "duration": "3 min"},
    {"title": "I Am Blessed", "duration": "3 min"},
    {"title": "I Am Merciful", "duration": "3 min"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: false,
        fieldText: 'Declare',
        rightIcon1: Image.asset('assets/icons/search.png'),
        onRightIcon1Pressed: () {},
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: ListView.builder(
          itemCount: audioItems.length,
          itemBuilder: (context, index) {
            final item = audioItems[index];
            return CustomAudioTile(
              title: item["title"]!,
              duration: item["duration"]!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioPlayerScreen(
                      title: item["title"]!,
                      totalDuration: item["duration"]!,
                      currentTime: '0:00',
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
