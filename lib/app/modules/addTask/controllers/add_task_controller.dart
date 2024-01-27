import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_tracker/app/utils/utility.dart';

class AddTaskController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();

  void onAddCreate() {}

  pickDate(BuildContext context) async {
    date.text = await showMaterialDatePicker(context) ?? '';
    update();
  }
}
