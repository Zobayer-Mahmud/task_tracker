import 'package:intl/intl.dart';

class TaskModel {
  bool? completed;
  String? sId;
  String? title;
  String? description;
  DateTime? dueDate;
  String? owner;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TaskModel(
      {this.completed,
      this.sId,
      this.title,
      this.description,
      this.dueDate,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  TaskModel.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    if (json['dueDate'] != null) {
      dueDate = DateTime.tryParse(json['dueDate']);
    }
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    if (dueDate != null) {
      //2024-01-21
      data['dueDate'] = DateFormat('yyyy-MM-dd').format(dueDate!);
    }
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
