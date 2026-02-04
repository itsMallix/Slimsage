import 'package:flutter/material.dart';
import 'package:miniproject/components/screen_progress/progress_card.dart';
import 'package:miniproject/models/database_models/database_provider.dart';
import 'package:miniproject/views/screen_progress/screen_progress_item.dart';
import 'package:provider/provider.dart';

class ProgressList extends StatelessWidget {
  final DbManager manager;
  const ProgressList({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    // final progressItems = manager.progressModel;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Consumer<DbManager>(
        builder: (context, manager, child) {
          final progressItems = manager.progressModel;
          return ListView.builder(
            itemCount: progressItems.length,
            itemBuilder: (context, index) {
              final item = progressItems[index];
              return InkWell(
                onTap: () async {
                  final selectedProgress =
                      await manager.getProgressById(item.id!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressItem(
                        progresModel: selectedProgress,
                      ),
                    ),
                  );
                },
                child: ProgressCard(
                  key: ValueKey(item.id),
                  progress: item,
                  onPressed: () {
                    manager.deleteProgress(item.id!);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Progress deleted sucessfully"),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
