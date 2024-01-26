import 'package:flutter/material.dart';
import 'package:task_tracker/app/common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String title;
  const CustomAppBar({super.key, this.height, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackTextColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);
}
