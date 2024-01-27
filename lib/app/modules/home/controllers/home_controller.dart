import 'package:get/get.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void goToAddTask() {
    Get.toNamed(Routes.ADD_TASK);
  }
}
