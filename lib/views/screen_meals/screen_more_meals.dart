import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniproject/components/theme.dart';

class MoreMeals extends StatelessWidget {
  const MoreMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Meals",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: Center(
        child: Text("More Meals"),
      ),
    );
  }
}
