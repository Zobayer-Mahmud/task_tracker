import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';
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
        appBar: const CustomAppBar(
          title: "Hello!",
          subTitle: "What's your plan for today ?",
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Gap(20),
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
                          "${controller.inCompleteTaskCount}",
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
                          "${controller.completeTaskCount}",
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
            if (controller.allTaskModel?.data?.isNotEmpty == true)
              ListView.builder(
                  primary: false,
                  itemCount: controller.allTaskModel?.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    TaskModel task = controller.allTaskModel!.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TaskItemWidget(
                        taskTitle: task.title,
                        taskDetails: task.description,
                        taskDate: task.dueDate,
                        isCompleted: task.completed ?? false,
                        onItemTap: () => controller.onItemTap(task.sId),
                      ),
                    );
                  })
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: controller.goToAddTask,
          child: SizedBox(
            width: 100,
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.white,
                ),
                const Gap(5),
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
