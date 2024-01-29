import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_tracker/app/api/api_client/dio_client.dart';
import 'package:task_tracker/app/api/db_client/db_client.dart';
import 'package:task_tracker/app/api/service/auth_service/auth_service.dart';
import 'package:task_tracker/app/api/service/profile_service/profile_service.dart';
import 'package:task_tracker/app/api/service/task_service/task_service.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';

class ServiceLocator {
  initializeApp() async {
    await GetStorage.init();
    Get.put<LocalStorage>(LocalStorage());

    await Get.putAsync<DioClient>(() => DioClient().init());
    await Get.putAsync<DBClient>(() => DBClient().init());
    await Get.putAsync<ProfileService>(() async => ProfileService());
    await Get.putAsync<AuthService>(() async => AuthService());
    await Get.putAsync<TaskService>(() async => TaskService());
    // await Get.putAsync<SharedPreferences>(
    //     () async => await SharedPreferences.getInstance());

    //register Services Here . . .
    // await Get.putAsync<ProfileService>(() async => ProfileService());

    // Get.put<DashboardController>(DashboardController(), permanent: true);
  }
}
