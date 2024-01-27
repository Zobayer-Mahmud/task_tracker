import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_up_model.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/common/app_constants.dart';
import 'package:task_tracker/app/utils/utility.dart';

class SignUpController extends GetxController {
  final AuthService authService = Get.find();
 late SharedPreferences sharedPreferences;
  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  signUp(BuildContext context) async {
    SignUpModel signUpModel() => updateSignUpModel();
    SignInResponse? signInResponse = await authService.signUp(signUpModel: signUpModel());
    if(signInResponse!=null) {
   if(signInResponse.token!=null)   sharedPreferences.setString(AppConstants.token, signInResponse.token!);
      showSnackBar("Sign up successfully!", context);
    }
  }

  SignUpModel updateSignUpModel() => SignUpModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        age: int.tryParse(ageController.text),
      );
}
