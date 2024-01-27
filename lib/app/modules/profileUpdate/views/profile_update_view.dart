import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
import 'package:task_tracker/app/utils/extentions/extentions.dart';
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
        body: Form(
          key: controller.profileUpdateKey,
          child: Column(
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
                                  ? FileImage(
                                      File(controller.profileImage!.path))
                                  : controller.userImage != null
                                      ? NetworkImage(
                                          controller.userImage!,
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
                            child: GestureDetector(
                              onTap: () async =>
                                  await controller.pickProfileImage(context),
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
                              ),
                            ))
                      ],
                    ),
                    Text("Name", style: Theme.of(context).textTheme.bodyMedium),
                    const Gap(10),
                    TextFormField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.name,
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                    const Gap(10),
                    Text("Email",
                        style: Theme.of(context).textTheme.bodyMedium),
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
                    const Gap(10),
                    Text("Age", style: Theme.of(context).textTheme.bodyMedium),
                    const Gap(10),
                    TextFormField(
                      controller: controller.ageController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                    ),
                    const Gap(10),
                    ElevatedButton(
                        onPressed: () => controller.updateProfile(context),
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
        ),
      );
    });
  }
}
