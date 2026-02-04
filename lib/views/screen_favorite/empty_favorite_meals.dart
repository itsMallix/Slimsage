import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/components/theme.dart';

class EmptyMealScreen extends StatelessWidget {
  const EmptyMealScreen({super.key});

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
                  "assets/images/mealScreen/empty_meal.svg",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "No Favorite Meals Found",
                style: DesignSystem.bodyLarge,
              ),
            ],
          )
        ],
      ),
    );
  }
}
