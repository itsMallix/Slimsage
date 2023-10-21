import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/progress_models/progress_model.dart';

class ProgressCard extends StatelessWidget {
  final ProgressModel progress;
  final Function() onPressed;
  const ProgressCard(
      {super.key, required this.progress, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10.0, right: 12.0, left: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: DesignSystem.maingrey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              if (progress.imagePath!.isNotEmpty)
                SizedBox(
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      File(progress.imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    width: 160,
                    child: Text(
                      progress.title!,
                      style: DesignSystem.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: Text(
                      progress.content!,
                      style: DesignSystem.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Delete Selected Progress?",
                        style: DesignSystem.headlineSmall,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: DesignSystem.bodyLarge,
                          ),
                        ),
                        TextButton(
                          onPressed: onPressed,
                          child: const Text(
                            "Delete",
                            style: DesignSystem.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  height: 80,
                  width: 60,
                  decoration: BoxDecoration(
                    color: DesignSystem.mainRed,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: DesignSystem.white,
                  ),
                ),
              )
            ],
          ),
        )
        // title: Text(
        //   progress.title!,
        //   style: DesignSystem.headlineSmall,
        // ),
        // subtitle: Row(
        //   children: [
        //     if (progress.imagePath!.isNotEmpty)
        //       Container(
        //         width: 100,
        //         height: 100,
        //         child: Image.file(
        //           File(progress.imagePath!),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(width: 100),
        //         Text("tanggal"),
        //         SizedBox(height: 10),
        //         Text(
        //           progress.content ?? 'null',
        //           style: DesignSystem.bodyMedium,
        //         ),
        //       ],
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         showDialog(
        //           context: context,
        //           builder: (context) => AlertDialog(
        //             title: const Text("hapus dek?"),
        //             actions: [
        //               TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).pop;
        //                 },
        //                 child: const Text("Cancel"),
        //               ),
        //               TextButton(
        //                 onPressed: onPressed,
        //                 child: const Text("Delete"),
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //       icon: Icon(Icons.delete),
        //     )
        //   ],
        );
  }
}
