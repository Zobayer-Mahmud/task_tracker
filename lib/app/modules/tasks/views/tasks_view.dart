import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
import 'package:task_tracker/app/modules/app_widgets/task_item/task_item_widget.dart';

import '../controllers/tasks_controller.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(builder: (controller) {
      return  Scaffold(
        appBar: const CustomAppBar(
          title: 'Tasks',
        ),
        body:ListView(          padding: const EdgeInsets.all(15),
          children: [
          ListView.builder(
              primary: false,
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TaskItemWidget(
                    taskTitle: "hi",
                    taskDetails:
                    "fafja adasdkhjad adsakhdhadh adsmahdahdsa daslfhafnaf asfkhapf fashfopsaf ",
                    taskDate: DateTime.now(),
                    isCompleted: true,
                    onItemTap: controller.onItemTap,
                  ),
                );
              })

        ],),
      );
    });
  }
}
