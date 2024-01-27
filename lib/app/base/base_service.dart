import 'package:get/get.dart';
import 'package:task_tracker/app/api/api_client/dio_client.dart';
import 'package:task_tracker/app/local_storage/local_storage.dart';


class BaseApiService extends GetxService {
// SharedController sharedController = Get.find();
  final DioClient dioClient = Get.find();
  final LocalStorage localStorage = Get.find();
}
