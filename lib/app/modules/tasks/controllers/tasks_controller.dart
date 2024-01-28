import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/all_task_model.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/api/service/task_service/task_service.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class TasksController extends GetxController {
  TaskService taskService = Get.find();

  @override
  void onInit() async {
    await getAllTask();
    super.onInit();
  }

  getByDate(DateTime? dateTime) {
    tasksList.clear();
    allTaskModel?.data?.forEach((element) {
      if (element.dueDate == dateTime) {
        tasksList.add(element);
      }
    });
  }

  AllTaskModel? allTaskModel;
  List<TaskModel> tasksList = [];
  getAllTask({bool? completed}) async {
    allTaskModel = await taskService.getAllTask(completed: completed);
    tasksList = allTaskModel?.data ?? [];
    print("taskList ${tasksList.length}");
    update();
  }

  void onItemTap(String? id) {
    Get.toNamed(Routes.EDIT_TASK, parameters: {'id': id ?? ''});
  }

  FilteredBy currentSelectedFilter = FilteredBy.all;

  selectActiveList(FilteredBy filteredBy, {bool? completed}) async {
    currentSelectedFilter = filteredBy;
    await getAllTask(completed: completed);

    update();
  }
}

enum FilteredBy { all, complete, incomplete }
