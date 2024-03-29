import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/api_client/dio_client.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_up_model.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/common/app_constants.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';
import 'package:task_tracker/app/routes/app_pages.dart';
import 'package:task_tracker/app/utils/utility.dart';

class SignUpController extends GetxController {
  final AuthService authService = Get.find();
  DioClient dioClient = Get.find();
  LocalStorage localStorage = Get.find();
  GlobalKey<FormState> signUpKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  signUp(BuildContext context) async {
    if (passwordController.text != repeatPasswordController.text) {
      showSnackBar("Password doesn't match", context);
    } else if (signUpKey.currentState?.validate() == true) {
      SignUpModel signUpModel() => updateSignUpModel();
      SignInResponse? signInResponse =
          await authService.signUp(signUpModel: signUpModel());
      if (signInResponse != null) {
        if (signInResponse.token != null) {
          localStorage.saveData(AppConstants.token, signInResponse.token!);
          if(signInResponse.user!=null)localStorage.saveData(AppConstants.userData, signInResponse.user!);
          dioClient.updateAuthToken(token: signInResponse.token);
          routeToDashBoard();
        }
        showSnackBar("Sign up successfully!", context);
      }
    }
  }

  SignUpModel updateSignUpModel() => SignUpModel(
        name: nameController.text,
        email: emailController.text.toLowerCase().trim(),
        password: passwordController.text.trim(),
        age: int.tryParse(ageController.text),
      );

  void routeToSignIn() {
  Get.toNamed(Routes.LOG_IN);
  }

  void routeToDashBoard() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  void floatingButton() {
    print("localStorage ${localStorage.getData(AppConstants.token)}");
    Get.toNamed(Routes.DASHBOARD);
  }
}
