import 'package:flutter/material.dart';
import 'package:task_tracker/app/common/app_colors.dart';

class FilteredButton extends StatelessWidget {
  const FilteredButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isActive = false});
  final VoidCallback onTap;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.dustyGrey : Colors.transparent,
          border: Border.all(color: const Color(0xff808080), width: 2),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: isActive ?Colors.white: const Color(0xff808080)),
        ),
      ),
    );
  }
}
