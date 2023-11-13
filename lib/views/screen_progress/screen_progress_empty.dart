import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/components/theme.dart';

class EmptyProgresScreen extends StatelessWidget {
  const EmptyProgresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 220),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  "assets/images/progresScreen/empty.svg",
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "No Progress Found",
                style: DesignSystem.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
