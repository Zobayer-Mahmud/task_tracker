import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';

import '../controllers/profile_update_controller.dart';

class ProfileUpdateView extends StatelessWidget{
  const ProfileUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateController>(
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(title: 'Profile',),
          body: const Center(
            child: Text(
              'ProfileUpdateView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      }
    );
  }
}
