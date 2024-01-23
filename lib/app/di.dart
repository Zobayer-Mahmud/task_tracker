import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'api/api_client/dio_client.dart';
import 'local_storage/local_storage.dart';

class ServiceLocator {
  initializeApp() async {
    await GetStorage.init();
    Get.put<LocalStorage>(LocalStorage());

    await Get.putAsync<DioClient>(() => DioClient().init());

    //register Services Here . . .
    // await Get.putAsync<ProfileService>(() async => ProfileService());

    // Get.put<DashboardController>(DashboardController(), permanent: true);
  }
}
