import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/themes/hom_palette.dart';

class AudioPlayerScreen extends StatelessWidget {
  static route({
    required String title,
    String totalDuration = '2:57',
    String currentTime = '1:25',
  }) =>
      MaterialPageRoute(
        builder: (context) => AudioPlayerScreen(
          title: title,
          totalDuration: totalDuration,
          currentTime: currentTime,
        ),
      );

  final String title;
  final String totalDuration;
  final String currentTime;

  const AudioPlayerScreen({
    super.key,
    required this.title,
    this.totalDuration = '2:57',
    this.currentTime = '1:25',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: InkWell(
          child: Image.asset('assets/icons/close_icon.png'),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            title,
            style: FontStyles.heading3.copyWith(
              color: AppColor.primary400,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 150,
            height: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: AppColor.transparentBlue,
            ),
            child: Center(
              child: Image.asset('assets/images/audio_play.png'),
            ),
          ),
          const SizedBox(height: 350),
          Slider(
            value: 85,
            min: 0,
            max: 100,
            activeColor: AppColor.greyscale900,
            inactiveColor: AppColor.greyscale300,
            onChanged: (value) {
              // Handle slider update
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTime,
                  style: FontStyles.bodySmall.copyWith(
                    color: AppColor.greyscale700,
                  ),
                ),
                Text(
                  totalDuration,
                  style: FontStyles.bodySmall.copyWith(
                    color: AppColor.greyscale700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
