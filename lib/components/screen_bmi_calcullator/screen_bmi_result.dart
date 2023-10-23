import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

class BmiResultScreen extends StatefulWidget {
  String result;
  String message;
  String description;

  BmiResultScreen({
    super.key,
    required this.result,
    required this.message,
    required this.description,
  });

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Body Mass Index Result",
          style: DesignSystem.headlineMedium,
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
                  "' ${widget.result} '",
                  style: DesignSystem.headlineLarge,
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: DesignSystem.secondBlue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(widget.message,
                      style: DesignSystem.headlineMediumWhite),
                ),
                const SizedBox(height: 50),
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
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: DesignSystem.mainGreen,
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Recalculate",
                  style: DesignSystem.headlineSmallWhite,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
