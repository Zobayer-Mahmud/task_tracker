import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/app/common/app_colors.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget(
      {super.key,
      this.taskTitle,
      this.taskDetails,
      this.taskDate,
      this.isCompleted = false,
      this.onCompleteTap,
      this.onItemTap});
  final String? taskTitle, taskDetails;
  final DateTime? taskDate;
  final bool isCompleted;
  final VoidCallback? onCompleteTap, onItemTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskTitle ?? '',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 12,
                            color: AppColors.dustyGrey,
                          ),
                          const Gap(5),
                          Text(
                            DateFormat('dd MMM yyyy')
                                .format(taskDate ?? DateTime.now()),
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.dustyGrey,
                                    ),
                          ),
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: AppColors.dustyGrey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              isCompleted ? "Complete" : "Incomplete",
                              style:
                                  Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: isCompleted
                                            ? Color(0xff61E064)
                                            : const Color(0xffFBBC04),
                                        fontSize: 10,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                Container(
                  decoration: BoxDecoration(
                      color:
                          isCompleted ? Color(0xff61E064) : AppColors.dustyGrey,
                      // color: const Color(0xff61E064),
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                  child: Icon(
                    Icons.check,
                    // color: Colors.white,
                    color: isCompleted ? Colors.white : Colors.transparent,
                    size: 14,
                  ),
                )
              ],
            ),
            const Gap(10),
            Text(
              taskDetails ??
                  '''Explore the power of our latest app feature - "Product Meeting." Effortlessly schedule and man
                            ''',
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
