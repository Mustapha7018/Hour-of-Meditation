import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/main/home_page.dart';
import 'package:hom_app/features/auth/presentation/pages/sign_in/forgot_password.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/input_field.dart';
import '../../../../../core/widgets/social_buttons.dart';
import '../../widgets/check_button.dart';

class SignInScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignInScreen());
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false;

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
              'Hello!',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Please enter your email & password to sign in.',
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomInputField(
              label: 'Email',
              initialValue: 'adamsmustapha888@gmail.com',
            ),
            const SizedBox(height: 20),
            const CustomInputField(
              label: 'Password',
              hintText: '********',
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckButton(
                  isChecked: _rememberMe,
                  onChanged: (selected) {
                    setState(() {
                      _rememberMe = selected;
                    });
                  },
                ),
                const SizedBox(width: 16),
                const Text(
                  'Remember me',
                  style: FontStyles.bodyRegular,
                ),
              ],
            ),
            const Divider(
              height: 50,
              color: AppColor.greyscale200,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, ForgotPasswordScreen.route());
                },
                child: Text(
                  'Forgot password',
                  style: FontStyles.heading4.copyWith(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "or Continue with",
                    style: FontStyles.heading4.copyWith(
                      color: AppColor.greyscale700,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(
                  assetPath: 'assets/images/google_img.png',
                  onPressed: () {},
                ),
                SocialButton(
                  assetPath: 'assets/images/apple_logo.png',
                  onPressed: () {},
                ),
                SocialButton(
                  assetPath: 'assets/images/facebook_logo.png',
                  onPressed: () {},
                ),
              ],
            ),
            const Spacer(),
            CustomButton.elevated(
              text: 'Sign In',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                Navigator.push(context, HomePage.route());
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
