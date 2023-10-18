import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Find A Place",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: Center(
        child: const Text("akan muncul map disini"),
      ),
    );
  }
}
