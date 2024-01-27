import 'package:task_tracker/app/api/api_client/api_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_up_model.dart';
import 'package:task_tracker/app/base/base_service.dart';
import 'package:task_tracker/app/common/api_end_point/api_end_point.dart';

class AuthService extends BaseApiService {
  signUp({SignUpModel? signUpModel}) async {
    ApiResponse apiResponse = await dioClient.post(
        endpoint: ApiEndPoint.userRegister, data: signUpModel?.toJson());

    print("api response ${apiResponse.response?.data}");
    try {
      if (apiResponse.success) {
        print(apiResponse.response?.data);
      } else {
        print("parse error");
      }
    } catch (e) {
      print("$e , signUp $runtimeType");
    }
  }
}
