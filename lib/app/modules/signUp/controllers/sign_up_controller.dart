import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_up_model.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/utils/utility.dart';

class SignUpController extends GetxController {
  final AuthService authService = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  signUp(BuildContext context) async {
    SignUpModel signUpModel() => updateSignUpModel();
    var response =await authService.signUp(signUpModel: signUpModel());
    showSnackBar("Sign up successfully!", context);
  }

  SignUpModel updateSignUpModel() => SignUpModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        age: int.tryParse(ageController.text),
      );
}
