import 'package:flutter/material.dart';
import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/font_styles.dart';
import '../../../../../core/themes/hom_palette.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: InkWell(
          child: Image.asset('assets/icons/close_icon.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: BodyPadding.small,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/pass.png'),
              const SizedBox(height: 24),

              // Congratulations text
              Text(
                'Congratulations!',
                style: FontStyles.heading3.copyWith(
                  color: AppColor.primary400,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle text
              Text(
                'You have completed the session',
                style: FontStyles.bodyXLarge.copyWith(
                  color: AppColor.greyscale800,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(
                color: AppColor.greyscale200,
              ),
              // Divider
              const SizedBox(height: 24),

              // Feedback container
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: AppColor.silver,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'How do you feel after this session?',
                      style: FontStyles.heading4
                          .copyWith(color: AppColor.primary400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset('assets/icons/happy.png',
                              width: 55, height: 55),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset('assets/icons/slightly_happy.png',
                              width: 55, height: 55),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset('assets/icons/neutral.png',
                              width: 55, height: 55),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset('assets/icons/sad.png',
                              width: 55, height: 55),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
