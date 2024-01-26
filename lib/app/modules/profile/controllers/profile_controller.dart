import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:task_tracker/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  PackageInfo? packageInfo;

  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    super.onInit();
    update();
  }

  void routeToProfileUpdate() {
    Get.toNamed(Routes.PROFILE_UPDATE);
  }
}
