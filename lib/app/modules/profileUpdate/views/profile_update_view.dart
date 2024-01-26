import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
import 'package:task_tracker/gen/assets.gen.dart';

import '../controllers/profile_update_controller.dart';

class ProfileUpdateView extends StatelessWidget {
  const ProfileUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Profile',
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xffC9D7FC),
                      const Color(0xffC9D7FC).withOpacity(0.8),
                      const Color(0xffC9D7FC).withOpacity(0.6),
                    ]),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Container(
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 95,
                            backgroundImage: controller.profileImage != null
                                ? FileImage(File(controller.profileImage!.path))
                                : controller.profileImage == null
                                    ? const NetworkImage(
                                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      )
                                    : AssetImage(
                                            Assets.png.userPlaceHolder.path)
                                        as ImageProvider,
                          ),
                        ),
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width * 0.5 + 10,
                          bottom: -8,
                          child: Container(
                            clipBehavior: Clip.none,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Container(
                              clipBehavior: Clip.none,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.photo_camera_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Text("Name", style: Theme.of(context).textTheme.bodyMedium),
                  const Gap(10),
                  TextFormField(controller: controller.nameController),
                  const Gap(10),
                  Text("Email", style: Theme.of(context).textTheme.bodyMedium),
                  const Gap(10),
                  TextFormField(controller: controller.emailController),
                  const Gap(10),
                  Text("Age", style: Theme.of(context).textTheme.bodyMedium),
                  const Gap(10),
                  TextFormField(controller: controller.ageController),
                  const Gap(10),
                  ElevatedButton(
                      onPressed: controller.updateProfile,
                      child: Text(
                        "Update",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
