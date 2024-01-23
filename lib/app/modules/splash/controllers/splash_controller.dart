import 'dart:async';

import 'package:get/get.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      if (getIsLoggedIn() == true) {
        Get.offAllNamed(Routes.LOG_IN);
      } else {
        Get.offAllNamed(Routes.SIGN_UP);
      }
    });
  }
  bool getIsLoggedIn(){
    // SharedPreferences preferences =Get.find();
    // return preferences.getBool(AppConstants.isLoggedIn)??false;
    return false;

  }
}
