import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Workout Recommendation",
          style: DesignSystem.headlineMedium,
        ),
      ),
    );
  }
}
