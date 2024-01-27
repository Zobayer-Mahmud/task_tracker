import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/app/common/app_colors.dart';

import '../controllers/edit_task_controller.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTaskController>(builder: (controller) {
      return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Gap(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.isEdit == true)
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: controller.title,
                              ),
                            ),
                            InkWell(
                              onTap: controller.onEditPressed,
                              child: const Icon(
                                Icons.done,
                                size: 20,
                                color: AppColors.dustyGrey,
                              ),
                            ),
                          ],
                        ),
                      if (controller.isEdit == false)
                        Row(
                          children: [
                            Text(
                              controller.title.text,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Gap(5),
                            InkWell(
                              onTap: controller.onEditPressed,
                              child: const Icon(
                                Icons.edit,
                                size: 25,
                                color: AppColors.dustyGrey,
                              ),
                            ),
                          ],
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
                          InkWell(
                            onTap: () => controller.pickDate(context),
                            child: Text(
                              DateFormat('dd MMM yyyy')
                                  .format(controller.date ?? DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.dustyGrey,
                                  ),
                            ),
                          ),
                          const Gap(10),
                          InkWell(
                            onTap: controller.onCompleteTap,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: AppColors.dustyGrey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                controller.isCompleted
                                    ? "Complete"
                                    : "Incomplete",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: controller.isCompleted
                                          ? const Color(0xff61E064)
                                          : const Color(0xffFBBC04),
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: controller.onCompleteTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: controller.isCompleted
                            ? const Color(0xff61E064)
                            : AppColors.dustyGrey,
                        // color: const Color(0xff61E064),
                        borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 2),
                    child: Icon(
                      Icons.check,
                      // color: Colors.white,
                      color: controller.isCompleted
                          ? Colors.white
                          : Colors.transparent,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            TextFormField(
              controller: controller.description,
              minLines: 7,
              maxLines: 10,
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:()=> controller.onUpdate(context),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff808080), width: 2),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Update Task",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: const Color(0xff808080)),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.check_outlined,
                          color: Color(0xff808080),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:()=> controller.onDeleteTap(context),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff808080), width: 2),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Delete Task",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: const Color(0xff808080)),
                        ),
                        const Gap(5),
                        const Icon(
                          Icons.delete,
                          color: Color(0xff808080),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
