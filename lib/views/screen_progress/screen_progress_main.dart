import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/database_models/database_provider.dart';
import 'package:miniproject/views/screen_progress/screen_progress_empty.dart';
import 'package:miniproject/views/screen_progress/screen_progress_item.dart';
import 'package:miniproject/views/screen_progress/screen_progress_list.dart';
import 'package:provider/provider.dart';

class ProgresScreen extends StatefulWidget {
  const ProgresScreen({super.key});

  @override
  State<ProgresScreen> createState() => _ProgresScreenState();
}

class _ProgresScreenState extends State<ProgresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildProgressScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DesignSystem.mainBlue,
        onPressed: () {
          final manager = Provider.of<DbManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProgressItem(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: DesignSystem.white,
        ),
      ),
    );
  }

  Widget buildProgressScreen() {
    return Consumer<DbManager>(
      builder: (context, value, child) {
        if (value.progressModel.isNotEmpty) {
          return ProgressList(manager: value);
        } else {
          return const EmptyProgresScreen();
        }
      },
    );
  }
}
