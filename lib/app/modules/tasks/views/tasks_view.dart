import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
import 'package:task_tracker/app/modules/app_widgets/task_item/task_item_widget.dart';
import 'package:task_tracker/app/modules/filter/filter_button.dart';

import '../controllers/tasks_controller.dart';

class TasksView extends StatelessWidget {
  const TasksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(builder: (controller) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: 'Tasks',
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilteredButton(
                      isActive:
                          controller.currentSelectedFilter == FilteredBy.all,
                      title: "All Tasks",
                      onTap: () => controller.selectActiveList(FilteredBy.all),
                    ),
                    Gap(10),
                    FilteredButton(
                      isActive: controller.currentSelectedFilter ==
                          FilteredBy.complete,
                      title: "Completed Tasks",
                      onTap: () => controller.selectActiveList(
                          FilteredBy.complete,
                          completed: true),
                    ),
                    Gap(10),
                    FilteredButton(
                      isActive: controller.currentSelectedFilter ==
                          FilteredBy.incomplete,
                      title: "Incompleted Tasks",
                      onTap: () => controller.selectActiveList(
                          FilteredBy.incomplete,
                          completed: false),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.tasksList.isNotEmpty == true)
              ListView.builder(
                  primary: false,
                  itemCount: controller.tasksList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    TaskModel task = controller.tasksList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TaskItemWidget(
                        taskTitle: task.title,
                        taskDetails: task.description,
                        taskDate: task.dueDate,
                        isCompleted: task.completed ?? false,
                        onItemTap: () => controller.onItemTap(task.sId),
                      ),
                    );
                  }),
            if (controller.tasksList.isEmpty == true)
              Center(
                child: Text(
                  "No task found",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
          ],
        ),
      );
    });
  }
}
