import 'package:al_3qed/Module/auth/model/user_model.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import '../../../core/helper/dio_helper.dart';

class ProfileService {
  static Future<UserModel> updateProfile(FormData? data) async {
    var response =
        await DioHelper.postFormData(AppApi.profileUrl, formData: data);
    return UserModel.fromJson(response.data["data"]);
  }

  static Future<UserModel> getProfile() async {
    var response = await DioHelper.getData(AppApi.profileUrl);
    return UserModel.fromJson(response.data["data"]);
  }

  static Future<bool> logout() async {
    var response = await DioHelper.getData(AppApi.logoutUrl);
    return response.data["success"];
  }
}
