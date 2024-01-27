import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/api/service/profile_service/profile_service.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';
import 'package:task_tracker/app/modules/app_widgets/app_dialog/app_dialog.dart';
import 'package:task_tracker/app/routes/app_pages.dart';
import 'package:task_tracker/app/utils/utility.dart';

class ProfileController extends GetxController {
  PackageInfo? packageInfo;
  AuthService authService = Get.find();
  ProfileService profileService = Get.find();
  LocalStorage localStorage = Get.find();
  String? userImageUrl;
  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    await getUser();
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

  User? user;
  getUser() async {
    user = await profileService.getUserByToken();
    if (user?.sId != null) await getUserImage(user?.sId);
    update();
  }

  getUserImage(String? id) async {
    userImageUrl = await profileService.getUserImage(id: id);
    update();
  }

  onUserDeleteTap(BuildContext context) async {
    bool result = await AppDialog.showConfirmationDialog(context,
        title: "Are you sure you want to delete?");
    if (result == true) {
      await profileService.deleteUser();
      await localStorage.clearStorage();
      Get.toNamed(Routes.LOG_IN);
      showSnackBar('Logged out successfully!', context);
    }
  }
}
