import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_colors.dart';
import 'package:task_tracker/gen/assets.gen.dart';

import '../controllers/log_in_controller.dart';

class LogInView extends GetView<LogInController> {
  const LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Gap(30),
              Text("Email",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
              const Gap(10),
              TextFormField(
                controller: controller.emailController,
              ),
              const Gap(30),
              Text("Password",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
              const Gap(10),
              TextFormField(
                controller: controller.passwordController,
              ),
              const Gap(30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Sign in",
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
                    text: "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                          text: " Sign In ",
                          style: const TextStyle(color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.routeToSignIn),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}