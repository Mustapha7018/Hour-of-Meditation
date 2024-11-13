import 'package:flutter/material.dart';
import 'package:hom_app/core/widgets/avatar.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/input_field.dart';

class PersonalInfoScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PersonalInfoScreen());
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBackButton: true,
        fieldText: 'Personal Info',
        rightIcon1: Image.asset('assets/icons/edit.png'),
        onRightIcon1Pressed: () {
          // Action for the more icon
        },
      ),
      body: Padding(
        padding: BodyPadding.medium,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: ProfileIcon(imageUrl: 'assets/images/person.png'),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomInputField(
                label: 'Full Name',
                initialValue: 'Dr. Emmanuel Adewusi',
              ),
              const SizedBox(height: 25),
              const CustomInputField(
                label: 'Email',
                initialValue: 'adamsmustapha888@gmail.com',
              ),
              const SizedBox(height: 25),
              const CustomInputField(
                label: 'Phone Number',
                initialValue: '+1-587-402-3641',
              ),
              const SizedBox(height: 25),
              CustomInputField(
                label: 'Date of Birth',
                hintText: '12/05/1982',
                icon: Icons.calendar_today_outlined,
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(height: 25),
              CustomInputField(
                label: 'Country',
                initialValue: 'Canada',
                icon: Icons.arrow_drop_down,
                readOnly: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
