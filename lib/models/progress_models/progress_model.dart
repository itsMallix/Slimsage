import 'package:intl/intl.dart';

class ProgressModel {
  late int? id;
  late String? title;
  late String? content;
  late String? imagePath;

  ProgressModel({
    this.id,
    this.title,
    this.content,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'imagePath': imagePath,
    };
  }

  ProgressModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
    imagePath = map['imagePath'];
  }

  String get date {
    final date = DateTime.fromMillisecondsSinceEpoch(id!);
    return DateFormat('EEE h:mm a, dd/MM/yyyy').format(date);
  }
}
