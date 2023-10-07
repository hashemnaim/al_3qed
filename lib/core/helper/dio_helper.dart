import 'dart:developer';

import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        sendTimeout: 60 * 2000,
        receiveTimeout: 60 * 1000,
        validateStatus: (status) {
          return status! <= 500;
        },
        headers: {
          'Content-Type': 'application/json',
          'API-KEY':
              'AWRsdgdyr5tDFHDF435345werfTer3dfgerSDFWFSD546&^&%@SDFsfd6545d',
          "X-localization": "ar",
          'Authorization': 'Bearer ${SPHelper.sHelper.getToken()}'
        }));
  }

  static Future<Response> getData(
    String url, {
    Map<String, dynamic>? query,
  }) async {
    log(SPHelper.sHelper.getToken());
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    return await dio!.post(url, data: data);
  }

  static Future<Response> postFormData(
    String url, {
    FormData? formData,
  }) async {
    return await dio!.post(url, data: formData);
  }

  static Future<Response> putData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    return await dio!.put(url, data: data);
  }

  static Future<Response> deleteData(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    return await dio!.delete(url, data: data);
  }
}
