import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_update_controller.dart';

class ProfileUpdateView extends StatelessWidget{
  const ProfileUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ProfileUpdateView'),
            centerTitle: true,
          ),
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
