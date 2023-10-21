import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

enum Gender {
  male,
  female,
}

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  Color inactiveColor = DesignSystem.white;
  Color activeColor = DesignSystem.mainGreen;
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                  ),
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
