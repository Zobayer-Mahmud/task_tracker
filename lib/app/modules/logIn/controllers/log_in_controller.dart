import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/api_client/dio_client.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/common/app_constants.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';
import 'package:task_tracker/app/routes/app_pages.dart';
import 'package:task_tracker/app/utils/utility.dart';

class LogInController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey();

  final AuthService authService = Get.find();
  DioClient dioClient = Get.find();
  LocalStorage localStorage = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  logIn(BuildContext context) async {
    if (loginKey.currentState?.validate() == true) {
      SignInResponse? signInResponse = await authService.logIn(
          email: emailController.text, password: passwordController.text);
      if (signInResponse != null) {
        if (signInResponse.token != null) {
          localStorage.saveData(AppConstants.token, signInResponse.token!);
          dioClient.updateAuthToken(token: signInResponse.token);
        }
        showSnackBar("Sign-in successfully!", context);
      } else {
        showSnackBar("Email and password doesn't match!", context);
      }
    }
  }

  void routeToSignIn() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
