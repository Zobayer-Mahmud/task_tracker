import 'package:flutter/foundation.dart';
import 'package:task_tracker/app/api/api_client/api_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_up_model.dart';
import 'package:task_tracker/app/base/base_service.dart';
import 'package:task_tracker/app/common/api_end_point/api_end_point.dart';

abstract class AuthServiceInterface {
  Future<SignInResponse?> signUp({SignUpModel? signUpModel});
  Future<SignInResponse?> logIn({String? email, String? password});
}

class AuthService extends BaseApiService implements AuthServiceInterface {
  @override
  Future<SignInResponse?> signUp({SignUpModel? signUpModel}) async {
    ApiResponse apiResponse = await dioClient.post(
        endpoint: ApiEndPoint.userRegister, data: signUpModel?.toJson());

    if (kDebugMode) {
      print("api response ${apiResponse.response?.data}");
    }
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        return SignInResponse.fromJson(apiResponse.response?.data);
      } else {
        if (kDebugMode) {
          print("parse error  signUp, $runtimeType");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e , signUp $runtimeType");
      }
      return null;
    }
  }

  @override
  Future<SignInResponse?> logIn({String? email, String? password}) async {
    ApiResponse apiResponse = await dioClient.post(
        endpoint: ApiEndPoint.userLogin,
        data: {"email": email, "password": password});

    if (kDebugMode) {
      print("api response ${apiResponse.response?.data}");
    }
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        return SignInResponse.fromJson(apiResponse.response?.data);
      } else {
        if (kDebugMode) {
          print("parse error  signUp, $runtimeType");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e , signUp $runtimeType");
      }
      return null;
    }
  }


   logOut()async{
    await dioClient.post(endpoint: ApiEndPoint.userLogOut);
  }
}
