import 'package:flutter/material.dart';
import 'package:hom_app/core/themes/font_styles.dart';
import 'package:hom_app/core/widgets/avatar.dart';
import 'package:hom_app/core/widgets/buttons.dart';
import 'package:hom_app/features/auth/presentation/pages/onboarding/onboarding8.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';
import '../../../../../core/widgets/input_field.dart';
import '../../widgets/linear_progress_indicator.dart';

class CompleteProfileScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const CompleteProfileScreen());
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
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
        title: const CustomProgressBar(progress: 0.87),
        centerTitle: true,
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complete Your Profile',
                style: FontStyles.heading3SemiBold,
              ),
              const SizedBox(height: 12),
              const Text(
                "Don't worry, only you can see your personal data. No one else will be able to see it.",
                style: FontStyles.bodyRegular,
              ),
              const SizedBox(height: 30),
              const Center(
                child: ProfileIcon(imageUrl: 'assets/images/person.png'),
              ),
              const SizedBox(height: 15),
              const CustomInputField(
                label: 'Full Name',
                initialValue: 'Dr. Emmanuel Adewusi',
              ),
              const SizedBox(height: 20),
              const CustomInputField(
                label: 'Phone Number',
                initialValue: '+1-587-402-3641',
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'Date of Birth',
                hintText: '12/05/1982',
                icon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'Country',
                initialValue: 'Canada',
                icon: Icons.arrow_drop_down,
                readOnly: true,
                onTap: () {},
              ),
              // const Spacer(),
              const SizedBox(height: 30),
              CustomButton.elevated(
                text: 'Continue',
                textStyle: FontStyles.bodyLarge.copyWith(color: AppColor.white),
                height: 60,
                width: double.infinity,
                colorFill: AppColor.primary300,
                onPressed: () {
                  Navigator.push(context, CreateAccountScreen.route());
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
      ),
    );
  }
}
