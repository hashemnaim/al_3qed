import 'dart:developer';

import 'package:al_3qed/Module/auth/model/login_model.dart';
import 'package:al_3qed/Module/auth/model/signup_model.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import '../../../core/helper/dio_helper.dart';

class AuthService {
  static Future<LoginModel> login(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.loginUrl, data: data);
    log(response.data.toString());
    return LoginModel.fromJson(response.data);
  }

  static Future<SignupModel> signup(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.signupUrl, data: data);

    return SignupModel.fromJson(response.data);
  }

  static Future<bool> verifyOtp(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.verificationUrl, data: data);

    log(response.data.toString());
    return response.data["success"];
  }
}
