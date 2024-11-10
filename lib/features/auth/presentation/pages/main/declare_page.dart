import 'package:flutter/material.dart';

class DeclareScreen extends StatelessWidget {
  const DeclareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Declare'),
      ),
      body: const Center(
        child: Text(
          'Declare Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}