import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/api_client/dio_client.dart';
import '../local_storage/local_storage.dart';
import '../utils/utility.dart';

class BaseController extends GetxController {

  final GlobalKey<ScaffoldState> baseScaffoldKey = GlobalKey<ScaffoldState>();
  final LocalStorage localStorage = Get.find();

  bool loader = false;






  startLoading() {
    if (!loader) {
      try {
        hideKeyboard();
        loader = true;
        update();
      } catch (e) {
        print("From global controller $e");
      }
    }
  }

  stopLoading() {
    if (loader) {
      try {
        loader = false;
        update();
      } catch (e) {
        print("From global controller $e");
      }
    }
  }
}
