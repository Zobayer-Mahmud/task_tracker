import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:task_tracker/app/api/api_client/api_response.dart';
import 'package:task_tracker/app/api/data/response/model/auth/sign_in_response.dart';
import 'package:task_tracker/app/base/base_service.dart';
import 'package:task_tracker/app/common/api_end_point/api_end_point.dart';

abstract class ProfileServiceInterface {
  Future<User?> getUserByToken();
  Future<String?> getUserImage({String? id});
  updateUser({User? user});
  uploadImage({required File image});
  Future<bool> deleteUserImage();
  Future<bool> deleteUser();
}

class ProfileService extends BaseApiService implements ProfileServiceInterface {
  @override
  Future<User?> getUserByToken() async {
    ApiResponse apiResponse = await dioClient.get(endpoint: ApiEndPoint.userMe);

    if (kDebugMode) {
      print("api response ${apiResponse.response?.data}");
    }
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        return User.fromJson(apiResponse.response?.data);
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
  Future<String?> getUserImage({String? id}) async {
    ApiResponse apiResponse = await dioClient.get(endpoint: "/user/$id/avatar");
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType get user image");
        return apiResponse.response?.data['image'];
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  updateUser({User? user}) async {
    ApiResponse apiResponse =
        await dioClient.put(endpoint: ApiEndPoint.userMe, data: user?.toJson());
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType upload update user");
        // return apiResponse.response?.data['image'];
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  uploadImage({required File image}) async {
    var file = MapEntry("avatar", image);

    ApiResponse apiResponse = await dioClient.requestWithFile(
        endPoint: ApiEndPoint.userMeAvatar, files: file);
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType upload image");
        // return apiResponse.response?.data['image'];
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  Future<bool> deleteUser() async {
    ApiResponse apiResponse =
        await dioClient.delete(endpoint: ApiEndPoint.userMe);
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType deleteUser");
        return true;
        // return apiResponse.response?.data['image'];
      } else {
        return false;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return false;
    }
  }

  @override
  Future<bool> deleteUserImage() async {
    ApiResponse apiResponse =
        await dioClient.delete(endpoint: ApiEndPoint.userMeAvatar);
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType deleteUserImage");
        return true;
        // return apiResponse.response?.data['image'];
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Api error $e $runtimeType");
      }
      return false;
    }
  }
}
