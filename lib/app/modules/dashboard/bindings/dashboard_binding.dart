import 'package:get/get.dart';
import 'package:task_tracker/app/modules/home/controllers/home_controller.dart';
import 'package:task_tracker/app/modules/profile/controllers/profile_controller.dart';
import 'package:task_tracker/app/modules/tasks/controllers/tasks_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.put(ProfileController(),permanent: true);
    Get.put(HomeController(),permanent: true);
    Get.put(TasksController(),permanent: true);
  }
}
