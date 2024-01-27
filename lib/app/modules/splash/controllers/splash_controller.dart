import 'dart:async';

import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_constants.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async{
   await startTimer();
    super.onInit();
  }

   startTimer() async{
 Timer(const Duration(seconds: 3), () {
      if (getIsLoggedIn() == true) {
        Get.offAllNamed(Routes.DASHBOARD);
      } else {
        Get.offAllNamed(Routes.LOG_IN);
      }
    });
  }

  bool getIsLoggedIn() {
    return Get.find<LocalStorage>().getData(AppConstants.token) != null;
  }
}
