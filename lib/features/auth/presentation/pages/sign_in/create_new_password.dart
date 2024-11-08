import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/main/home_page.dart';
import 'package:hom_app/features/auth/presentation/widgets/check_button.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/alert_modal.dart';
import '../../../../../core/widgets/input_field.dart';

class CreateNewPassword extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const CreateNewPassword());
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create New Password',
              style: FontStyles.heading3SemiBold,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Enter your new password.",
              style: FontStyles.bodyRegular,
            ),
            const SizedBox(
              height: 30,
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
              text: 'Continue',
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
      return CustomModal(
        headText: "Password Reset Successful!",
        message: "Your password has been successfully changed.",
        withButton: true,
        buttonText: 'Go to Home',
        onButtonPressed: () {
          Navigator.push(context, HomePage.route());
        },
        modalImage: 'assets/images/account_image.png',

      );
    },
  );
}


