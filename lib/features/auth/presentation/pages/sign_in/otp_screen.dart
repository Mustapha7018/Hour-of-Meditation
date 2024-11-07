import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/sign_in/create_new_password.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';

class OtpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const OtpScreen());
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: InkWell(
          child: Image.asset('assets/images/left_arrow.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "You've Got Mail",
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'We have sent the OTP verification to your email address. Check your email and enter the code below.',
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(
              height: 55,
            ),
            OtpTextField(
              numberOfFields: 4,
              textStyle: FontStyles.heading4,
              borderColor: AppColor.greyscale200,
              fillColor: AppColor.transparentBlue,
              fieldHeight: 60,
              fieldWidth: 85,
              margin: const EdgeInsets.only(right: 10),
              borderRadius: BorderRadius.circular(16),
              cursorColor: AppColor.greyscale900,
              focusedBorderColor: AppColor.primary500,
              styles: [
                FontStyles.heading4.copyWith(),
                FontStyles.heading4,
                FontStyles.heading4,
                FontStyles.heading4,
              ],
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: false), 
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Didn't receive email?",
                    style: FontStyles.bodyRegular,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "You can resend code in 55 s",
                    style: FontStyles.bodyRegular,
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton.elevated(
              text: 'Confirm',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                Navigator.push(context, CreateNewPassword.route());
              },
              boxShadow: [
                BoxShadow(
                  color: AppColor.greyscale900.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
