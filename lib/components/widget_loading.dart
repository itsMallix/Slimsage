import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: DesignSystem.mainGreen,
        strokeWidth: 1.5,
        backgroundColor: DesignSystem.white,
      ),
    );
  }
}
