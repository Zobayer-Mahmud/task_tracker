import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class LogInController extends GetxController {


  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }


  void routeToSignIn() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
