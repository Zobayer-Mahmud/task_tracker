import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:task_tracker/app/modules/app_widgets/app_bar/custom_app_bar.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(builder: (controller) {
      return Scaffold(
        appBar: const CustomAppBar(title: "New Task"),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Text("Title", style: Theme.of(context).textTheme.bodyMedium),
            const Gap(10),
            TextFormField(
              controller: controller.title,
              decoration: const InputDecoration(hintText: 'Type here'),
            ),
            const Gap(10),
            Text("Date", style: Theme.of(context).textTheme.bodyMedium),
            const Gap(10),
            TextFormField(
              controller: controller.date,
              decoration: const InputDecoration(
                  hintText: "dd/mm/yyyy",
                  suffixIcon: Icon(Icons.calendar_month)),
            ),
            const Gap(10),
            Text("Description", style: Theme.of(context).textTheme.bodyMedium),
            const Gap(10),
            TextFormField(
              controller: controller.description,
              decoration: const InputDecoration(hintText: 'Type here'),
              minLines: 5,
              maxLines: 5,
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: controller.onAddCreate,
            child: Text(
              "Create Task",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
