import 'package:flutter/material.dart';

import '../../../../../core/themes/body_padding.dart';
import '../../../../../core/themes/hom_palette.dart';

class HomePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      body: const Padding(
        padding: BodyPadding.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('THIS IS THE HOMEPAGE', style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
