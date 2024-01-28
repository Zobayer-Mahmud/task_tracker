import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/api/service/task_service/task_service.dart';
import 'package:task_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:task_tracker/app/modules/tasks/controllers/tasks_controller.dart';
import 'package:task_tracker/app/utils/utility.dart';

class AddTaskController extends GetxController {
  TaskService taskService = Get.find();
  HomeController homeController = Get.find();
  TasksController tasksController = Get.find();
  DateTime? pickedDate;
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();

  onAddCreate(BuildContext context) async {
    TaskModel taskModel = TaskModel(
      title: title.text,
      dueDate: pickedDate,
      description: description.text,
    );
    bool result = await taskService.addTask(taskModel);
    if (result == true) {
      showSnackBar("Task added successfully!", context);
      await homeController.getAllTask();
      await tasksController.getAllTask();
      Get.back();
    }else{
      showSnackBar("Failed to add task!", context);

    }
  }

  pickDate(BuildContext context) async {
    pickedDate = await showDatePickerFunction(context);
    if (pickedDate != null) {
      date.text = "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
      update();
    }
  }
}
