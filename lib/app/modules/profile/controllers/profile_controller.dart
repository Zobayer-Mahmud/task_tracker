import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';
import 'package:task_tracker/app/modules/app_widgets/app_dialog/app_dialog.dart';
import 'package:task_tracker/app/routes/app_pages.dart';
import 'package:task_tracker/app/utils/utility.dart';

class ProfileController extends GetxController {
  PackageInfo? packageInfo;
  AuthService authService = Get.find();
  LocalStorage localStorage = Get.find();

  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    super.onInit();
    update();
  }

  void routeToProfileUpdate() {
    Get.toNamed(Routes.PROFILE_UPDATE);
  }

  onLogOutTap(BuildContext context) async {
    bool result = await AppDialog.showConfirmationDialog(context);
    if (result == true) {
      await authService.logOut();
      await localStorage.clearStorage();
      Get.toNamed(Routes.LOG_IN);
      showSnackBar('Logged out successfully!', context);
    }
  }
}
