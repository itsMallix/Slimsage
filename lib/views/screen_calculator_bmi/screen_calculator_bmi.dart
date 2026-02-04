import 'package:flutter/material.dart';
import 'package:miniproject/components/screen_bmi_calcullator/widget_gender.dart';
import 'package:miniproject/components/theme.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index Calcullator",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const Column(
            children: [
              GenderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
