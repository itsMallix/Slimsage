import 'package:flutter/material.dart';
import 'package:miniproject/helper/helper_database.dart';
import 'package:miniproject/models/progress_models/progress_model.dart';

class DbManager extends ChangeNotifier {
  List<ProgressModel> progressModel = [];
  late DatabaseHelper _databaseHelper;

  List<ProgressModel> get progress => progressModel;

  void _getAllProgress() async {
    progressModel = await _databaseHelper.getProgress();
    notifyListeners();
  }

  DbManager() {
    _databaseHelper = DatabaseHelper();
    _getAllProgress();
  }

  Future<void> addProgress(ProgressModel progress) async {
    await _databaseHelper.insertProgress(progress);
    _getAllProgress();
  }

  Future<ProgressModel> getProgressById(int id) async {
    return await _databaseHelper.getProgressById(id);
  }

  void updateProgress(ProgressModel progress) async {
    await _databaseHelper.updateProgress(progress);
    _getAllProgress();
  }

  void deleteProgress(int id) async {
    await _databaseHelper.deleteProgress(id);
    _getAllProgress();
  }
}
