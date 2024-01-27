import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/app/common/app_colors.dart';
import 'package:task_tracker/app/modules/app_widgets/task_item/task_item_widget.dart';
import 'package:task_tracker/gen/assets.gen.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: const Color(0xffECECEC).withOpacity(0.2),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Gap(20),
            Text(
              "Hello",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "What's your plan for today ?",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Gap(20),
            Text(
              "Task Summary",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(Assets.png.incomplete.path)),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        )),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Container(
                    height: 100,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(Assets.png.complete.path)),
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '12',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
            const Gap(10),
            Text(
              "Tasks for the Day",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(15),
            Container(
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
                              "Product Meeting",
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
                                      .format(DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.dustyGrey,
                                      ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color:
                                          AppColors.dustyGrey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text(
                                    "Incomplete",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          //for Incompleted
                                          color: const Color(0xffFBBC04),

                                          //for completed
                                          // color: Color(0xff61E064),
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
                            color: const Color(0xff979797),
                            // color: const Color(0xff61E064),
                            borderRadius: BorderRadius.circular(4)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2),
                        child: const Icon(
                          Icons.check,
                          // color: Colors.white,
                          color: Colors.transparent,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                  const Gap(10),
                  Text(
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
            ListView.builder(
                primary: false,
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TaskItemWidget(
                      taskTitle: "hi",
                      taskDetails:
                          "fafja adasdkhjad adsakhdhadh adsmahdahdsa daslfhafnaf asfkhapf fashfopsaf ",
                      taskDate: DateTime.now(),
                      isCompleted: true,
                    ),
                  );
                })
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: controller.goToAddTask,
          child: Container(
            width: 100,
            child: Row(
              children: [
                Icon(Icons.add,size: 24,color: Colors.white,),
                Gap(5),
                Text(
                  "Add Task",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
