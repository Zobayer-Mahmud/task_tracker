import 'package:flutter/material.dart';
import 'package:task_tracker/app/common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String title;
  final String? subTitle;
  final bool automaticallyImplyLeading;
  const CustomAppBar({super.key, this.height, required this.title,this.automaticallyImplyLeading =false, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(automaticallyImplyLeading: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.blackTextColor),
          ),
          if(subTitle!=null)
            Text(
              subTitle!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 50);
}
