import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/common/app_colors.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  void changeIndex(int value) {
    selectedIndex = value;
    update();
  }

  BottomNavigationBarItem bottomNavigationBarItem(String title, IconData icon,
          {String? profileImageUrl}) =>
      BottomNavigationBarItem(
        icon: profileImageUrl?.isNotEmpty == true
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(profileImageUrl!),
              )
            : Icon(
                icon,
                color: const Color(0xffC6C6C6),
              ),
        activeIcon: profileImageUrl?.isNotEmpty == true
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  profileImageUrl!,
                ),
              )
            : Icon(
                icon,
                color: AppColors.primaryColor,
              ),
        label: title,
      );
}
