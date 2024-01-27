import 'package:intl/intl.dart';

class TaskModel {
  String? title;
  String? description;
  DateTime? dueDate;
  bool? completed;

  TaskModel({this.title, this.description, this.dueDate, this.completed});

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (dueDate != null) {
      dueDate = DateTime.tryParse(json['dueDate']);
    }
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    if (dueDate != null) {
      //2024-01-21
      data['dueDate'] = DateFormat('yyyy-MM-dd').format(dueDate!);
    }
    data['completed'] = completed;
    return data;
  }
}
