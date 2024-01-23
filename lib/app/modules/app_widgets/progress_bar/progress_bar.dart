import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingProgressBar extends StatelessWidget {
  final Color? color;
  final double? size;

  const LoadingProgressBar({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(
          child: SizedBox(
              height: size ?? 20.0,
              width: size ?? 20.0,
              child: CircularProgressIndicator.adaptive(
                backgroundColor: color,
              ))),
    );
  }
}
