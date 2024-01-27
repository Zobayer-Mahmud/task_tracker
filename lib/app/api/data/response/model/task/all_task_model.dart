import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';

class AllTaskModel {
  int? count;
  List<TaskModel>? data;

  AllTaskModel({this.count, this.data});

  AllTaskModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <TaskModel>[];
      json['data'].forEach((v) {
        data!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
