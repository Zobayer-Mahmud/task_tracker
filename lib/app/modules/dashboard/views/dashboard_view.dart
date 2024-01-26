import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_colors.dart';
import 'package:task_tracker/app/modules/home/views/home_view.dart';
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
             controller.bottomNavigationBarItem("Profile", Icons.account_circle_outlined,profileImageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ],
          ));
    });
  }
}
