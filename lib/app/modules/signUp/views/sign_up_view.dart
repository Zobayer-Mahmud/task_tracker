import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_colors.dart';
import 'package:task_tracker/app/utils/extentions/extentions.dart';
import 'package:task_tracker/gen/assets.gen.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: controller.floatingButton,),
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image.asset(Assets.png.authBg.path),
            Positioned(
                left: 10,
                top: 20,
                child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.30),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ))),
            Positioned(
              top: 0,
              bottom: 0,
              right: 100,
              left: 100,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.png.logo.path,
                  height: 80,
                  width: 80,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: const Color(0xff8C88CD)),
                ),
                const Gap(15),
                Text("Name *",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                const Gap(10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                  validator: (v) {
                    if (v?.isEmpty == true) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                const Gap(15),
                Text("Email *",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                const Gap(10),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v?.isNotEmpty == true) {
                      if (v!.isValidEmail == true) {
                        return null;
                      } else {
                        return "please, Enter a valid email";
                      }
                    } else {
                      return "Email is required";
                    }
                  },
                ),
                const Gap(15),
                Text("Age",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                const Gap(10),
                TextFormField(
                  controller: controller.ageController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                ),
                const Gap(15),
                Text("Password *",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                const Gap(10),
                TextFormField(
                  controller: controller.passwordController,
                  validator: (v) {
                    if (v?.isEmpty == true) {
                      return "Password is required";
                    } else if (v!.length < 7) {
                      return "Password must contain at least 7 character";
                    }
                    return null;
                  },
                ),
                const Gap(15),
                Text("Retype Password",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                const Gap(10),
                TextFormField(
                  controller: controller.repeatPasswordController,
                  validator: (v) {
                    if (v?.isEmpty == true) {
                      return "Password is required";
                    } else if (v!.length < 7) {
                      return "Password must contain at least 7 character";
                    }
                    return null;
                  },
                ),
                const Gap(15),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async =>
                              await controller.signUp(context),
                          child: Text(
                            "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          )),
                    ),
                  ],
                ),
                const Gap(10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                            text: " Sign In ",
                            style:
                            const TextStyle(color: AppColors.primaryColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.routeToSignIn),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
