import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/views/screen_calculator_bmi/screen_calculator_bmi.dart';

class BmiResultScreen extends StatefulWidget {
  final String result;
  final String message;
  final String description;

  const BmiResultScreen({
    Key? key,
    required this.result,
    required this.message,
    required this.description,
  }) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  void intiState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index Result",
          style: DesignSystem.headlineMedium,
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BmiScreen(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Your BMI Score : ",
              style: DesignSystem.headlineLarge,
            ),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.result,
                  style: DesignSystem.headlineLarge,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.description,
                    style: DesignSystem.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BmiScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: DesignSystem.mainBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Recalculate",
                  style: DesignSystem.headlineSmallWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
