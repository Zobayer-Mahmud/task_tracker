import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/api/service/task_service/task_service.dart';
import 'package:task_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:task_tracker/app/utils/utility.dart';

class EditTaskController extends GetxController {
  HomeController homeController = Get.find();
  TaskService taskService = Get.find();
  bool isCompleted = false;
  bool isEdit = false;
  String? id;
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  DateTime? date;
  TaskModel? task;
  @override
  void onInit() async {
    id = Get.parameters['id'];
    await getTaskById(id);
    super.onInit();
  }

  void onDeleteTap(BuildContext context) async{
bool result = await taskService.deleteTaskById(id);
if(result){
  showSnackBar("Deleted successfully", context);
  await homeController.getAllTask();
  Get.back();
}
  }

  getTaskById(String? id) async {
    task = await taskService.getTaskById(id);
    await setInititalData();
    update();
  }

  setInititalData() {
    title.text = task?.title ?? "";
    description.text = task?.description ?? "";
    date = task?.dueDate;
    isCompleted = task?.completed ?? false;
    update();
  }

  void onEditPressed() {
    isEdit = !isEdit;
    update();
  }

  void onCompleteTap() {
    isCompleted = !isCompleted;
    update();
  }

  pickDate(BuildContext context) async {
    DateTime? dateTime = await showDatePickerFunction(context);
    if (dateTime != null) {
      date = dateTime;
      update();
    }
  }

  void onSubmit(BuildContext context) async {
    if (title.text.isEmpty == true || date == null) {
      showSnackBar('Title and Date are required', context);
    } else {
      updateTaskModel();
      bool isUpdated =
          await taskService.updateTaskById(id: id, taskModel: task);
      if (isUpdated) {
        showSnackBar("Updated successfully", context);
        await homeController.getAllTask();
        Get.back();
      } else {
        showSnackBar("Failed to update", context);
      }
    }
  }

  void updateTaskModel() {
    task?.dueDate = date;
    task?.description = description.text;
    task?.title = title.text;
    task?.completed = isCompleted;
    update();
  }
}
