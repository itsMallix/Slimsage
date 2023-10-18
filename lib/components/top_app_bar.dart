import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/viewModels/viewModels_users.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
      builder: (context, userManager, child) {
        return AppBar(
          title: Text(
            "Hello ${userManager.userModel?.username ?? ''}",
            style: DesignSystem.headlineMedium,
          ),
        );
      },
    );
  }
}
