import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/models/progress_models/progress_model.dart';

class ProgressProvider extends ChangeNotifier {
  final _progressModel = <ProgressModel>[];
  List<ProgressModel> get progressModel => List.unmodifiable(_progressModel);

  void addProgress(ProgressModel progress) {
    _progressModel.add(progress);
    notifyListeners();
  }

  void deleteProgress(int index) {
    _progressModel.removeAt(index);
    notifyListeners();
  }
}
