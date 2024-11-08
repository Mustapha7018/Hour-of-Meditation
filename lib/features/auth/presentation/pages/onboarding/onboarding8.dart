import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/main/home_page.dart';
import 'package:hom_app/features/auth/presentation/widgets/check_button.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/alert_modal.dart';
import '../../../../../core/widgets/input_field.dart';
import '../../widgets/linear_progress_indicator.dart';

class CreateAccountScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const CreateAccountScreen());
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _rememberMe = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: InkWell(
          child: Image.asset('assets/icons/left_arrow.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomProgressBar(progress: 1.0),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create an Account',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Enter your account email & password.",
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
            const SizedBox(height: 20),
            const CustomInputField(
              label: 'Confirm Password',
              hintText: '********',
              isPassword: true,
            ),
            const SizedBox(height: 24),
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
            const Spacer(),
            CustomButton.elevated(
              text: 'Sign Up',
              textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
              height: 60,
              width: double.infinity,
              colorFill: AppColor.primary300,
              onPressed: () {
                _showSuccessModal(context);
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


void _showSuccessModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Display the modal dialog
      return const CustomModal(
        headText: "Sign Up Successful!",
        message: "Your account has been created. Welcome to the Hour Of Meditation.",
        withButton: false,
        modalImage: 'assets/images/account_image.png',
      );
    },
  );

  // Automatically navigate to HomePage after a delay
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pop(); // Close the modal
    Navigator.pushReplacement(context, HomePage.route()); 
  });
}


