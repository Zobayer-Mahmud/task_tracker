import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_colors.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
import 'package:task_tracker/gen/assets.gen.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(title: "Profile"),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: controller.routeToProfileUpdate,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: controller.userImageUrl != null
                            ? NetworkImage(controller.userImageUrl!)
                            : AssetImage(Assets.png.userPlaceHolder.path)
                                as ImageProvider,
                      ),
                      const Gap(10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.user?.name ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            const Gap(10),
                            Text(controller.user?.email ?? '',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    const Icon(
                      Icons.power_settings_new,
                      size: 24,
                      color: Color(0xffF6736B),
                    ),
                    GestureDetector(
                      onTap: ()async =>await controller.onLogOutTap(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("Log out",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      size: 24,
                      color: Color(0xffF6736B),
                    ),
                    GestureDetector(
                      onTap: () async=>await controller.onUserDeleteTap(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("Delete User",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              if (controller.packageInfo != null)
                Center(
                  child: Text(
                    "Version: ${controller.packageInfo?.version ?? ''}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff979797)),
                  ),
                )
            ],
          ),
        ),
      );
    });
  }
}
