import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/all_task_model.dart';
import 'package:task_tracker/app/api/service/task_service/task_service.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class HomeController extends GetxController {
  TaskService taskService = Get.find();
  int completeTaskCount = 0, inCompleteTaskCount = 0;
  AllTaskModel? allTaskModel;
  @override
  void onInit() async {
    await getAllTask();
    super.onInit();
  }

  void goToAddTask() {
    Get.toNamed(Routes.ADD_TASK);
  }

  void onItemTap(String? id) {
    Get.toNamed(Routes.EDIT_TASK, parameters: {'id': id ?? ''});
  }

  getAllTask() async {
    allTaskModel = await taskService.getAllTask();
    update();
    completeTaskCount = completedCount();
    inCompleteTaskCount = (allTaskModel?.count ?? 0) - completeTaskCount;
    update();
  }

  int completedCount() {
    int count = 0;
    allTaskModel?.data?.map((e) {
      if (e.completed == true) count++;
    });
    return count;
  }

  int inCompletedCount() => (allTaskModel?.count ?? 0) - completedCount();
}
