import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/core/constants/status_code.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_exceptions.dart';

class BaseClient {
  static final Dio _dio = Dio();
  static const int tIMEOUTDURATION = 20;
  BaseClient._();
  static BaseClient baseClient = BaseClient._();

  get(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      required Function(Response response) onSuccess,
      Function? onLoading,
      Function? erorr}) async {
    try {
      // log(SHelper.sHelper.getToken());
      onLoading?.call();
      var response = await _dio
          .get(
            url,
            queryParameters: queryParameters,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                "Accept": "application/json",
                "Accept-Language": "ar",
                'Authorization': 'Bearer ${SPHelper.sHelper.getToken()}'
              },
            ),
          )
          .timeout(const Duration(seconds: tIMEOUTDURATION));
      await onSuccess(response);
    } on DioError catch (error) {
      erorr?.call();

      BotToast.closeAllLoading();
      return handleDioError(error);
    }
  }

  post(String url,
      {Map<String, dynamic>? headers,
      dynamic data,
      required Function(Response response) onSuccess,
      Function? onLoading,
      Function? erorr}) async {
    try {
      onLoading?.call();
      var response = await _dio
          .post(url,
              data: data,
              options: Options(headers: {
                'Content-Type': 'application/json',
                "Accept-Language": "ar",
                'Authorization': 'Bearer ${SPHelper.sHelper.getToken()}'
              }))
          .timeout(const Duration(seconds: tIMEOUTDURATION));
      await onSuccess(response);
    } on DioError catch (error) {
      erorr?.call();

      BotToast.closeAllLoading();
      return handleDioError(error);
    }
  }

  delete(String url,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? data,
      required Function(Response response) onSuccess,
      Function? onLoading,
      Function? erorr}) async {
    try {
      onLoading?.call();
      var response = await _dio
          .delete(
            url,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ${SPHelper.sHelper.getToken()}'
              },
            ),
          )
          .timeout(const Duration(seconds: tIMEOUTDURATION));
      await onSuccess(response);
    } on DioError catch (error) {
      erorr?.call();

      BotToast.closeAllLoading();
      return handleDioError(error);
    }
  }

  _handleError(String msg) {
    BotToast.closeAllLoading();
    BotToast.showText(contentColor: Colors.red, text: msg);
  }

  dynamic handleDioError(DioError dioError) {
    switch (dioError.response?.statusCode) {
      case StatusCode.badRequest:
        _handleError(dioError.message);

        throw BadRequestException();

      case StatusCode.unAuthorized:
        // MySharedPref.clear();
        // getx.Get.offAllNamed(Routes.LoginScreen1);
        break;

      case StatusCode.forbidden:
        _handleError(dioError.message);

        throw UnauthorizedException();

      case StatusCode.notFound:
        _handleError(dioError.message);

        throw NotFoundException();
      case StatusCode.confilct:
        _handleError(dioError.message);

        throw ConflictException();
      case StatusCode.internalServerErorr:
        // _handleError(dioError.message!);

        throw InternalServerErrorException();

      default:
        throw InternalServerErrorException();
    }
  }
}
