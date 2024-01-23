import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_tracker/gen/assets.gen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.png.splashBg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.png.logo.path,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
