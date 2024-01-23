import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import '../../common/app_constants.dart';
import '../../local_storage/local_storage.dart';
import '../../local_storage/local_storage_key.dart';
import '../../utils/typedefs.dart';
import 'api_response.dart';

class DioClient extends g.GetxService {
  late Dio _dio;
  Map<String, String?>? _header;

  Future<DioClient> init() async {
    _header = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.contentTypeHeader: "application/json",
      if (LocalStorage().getData(LocalStorageKey.TOKEN) != null)
        HttpHeaders.authorizationHeader:
            'Bearer ${LocalStorage().getData(LocalStorageKey.TOKEN)}',
    };

    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: _header,
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
    ));

    /// Need to intercept all request for language
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          updateLanguage();
          _dio.options.headers = _header;
          handler.next(options);
        },
      ),
    );

    return this;
  }

  updateLanguage() {
    _dio.options.headers = _header;
    return _header;
  }

  updateAuthToken({required String? token}) {
    if (token != null) {
      _header?[HttpHeaders.authorizationHeader] = 'Bearer $token';
      _dio.options.headers = _header;
    }
  }

  clearAuthorization() {
    _header
        ?.removeWhere((key, value) => key == HttpHeaders.authorizationHeader);
    _dio.options.headers = _header;
  }

  Future<ApiResponse> get(
      {required String endpoint, MapData? queryParams}) async {
    queryParams?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> post({
    required String endpoint,
    MapData? data,
    MapData? queryParams,
  }) async {
    queryParams?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");
    data?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParams,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> put({required String endpoint, MapData? data}) async {
    // if (showApiLoading == true)

    data?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");

    try {
      final response = await _dio.put(
        endpoint,
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> requestWithFile(
      {required String endPoint,
      Map<String, dynamic>? body,
      MapEntry<String, File>? files}) async {
    try {
      FormData formData = FormData.fromMap(body ?? {});

      if (files != null) {
        formData.files.add(MapEntry(
            files.key,
            MultipartFile.fromFileSync(files.value.path,
                filename: files.value.path.split("/").last)));
      }

      final response = await _dio.post(endPoint, data: formData);

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> patch(
      {required String endpoint, MapData? data, bool? showApiLoading}) async {
    data?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> delete(
      {required String endpoint, MapData? data, bool? showApiLoading}) async {
    data?.removeWhere(
        (key, value) => value == "null" || value == null || value == "");
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}
