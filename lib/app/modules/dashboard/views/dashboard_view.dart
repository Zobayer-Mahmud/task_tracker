import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/modules/home/views/home_view.dart';
import 'package:task_tracker/app/modules/profile/controllers/profile_controller.dart';
import 'package:task_tracker/app/modules/profile/views/profile_view.dart';
import 'package:task_tracker/app/modules/tasks/views/tasks_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: const [
              HomeView(),
              TasksView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: controller.changeIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            currentIndex: controller.selectedIndex,
            items: [
              controller.bottomNavigationBarItem("Home", Icons.home),
              controller.bottomNavigationBarItem("Tasks", Icons.grid_view),
              controller.bottomNavigationBarItem(
                "Profile",
                Icons.account_circle_outlined,
                profileImageUrl: Get.find<ProfileController>().userImageUrl,
              ),
            ],
          ));
    });
  }
}
