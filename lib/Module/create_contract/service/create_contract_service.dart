import 'package:al_3qed/Module/create_contract/model/step_model.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import '../../../core/helper/dio_helper.dart';
import 'package:dio/dio.dart' as dio;

class CreateContractService {
  static Future<bool> contractStart(Map<String, dynamic> data) async {
    var response =
        await DioHelper.postData(AppApi.contractStartUrl, data: data);
    return response.data["success"];
  }

  static Future<dynamic> uncompletedContract(Map<String, dynamic> data) async {
    var response =
        await DioHelper.postData(AppApi.uncompletedContractUrl, data: data);
    return response.data;
  }

  static Future<StepModel> setStep1(dio.FormData? formData) async {
    var response =
        await DioHelper.postFormData(AppApi.step1Url, formData: formData);
    return StepModel.fromJson(response.data);
  }

  static Future<StepModel> setStep2(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.step2Url, data: data);
    return StepModel.fromJson(response.data);
  }

  static Future<StepModel> setStep4(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.step4Url, data: data);
    return StepModel.fromJson(response.data);
  }

  static Future<StepModel> setStep5(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.step5Url, data: data);
    return StepModel.fromJson(response.data);
  }

  static Future<StepModel> setStep6(Map<String, dynamic> data) async {
    var response = await DioHelper.postData(AppApi.step6Url, data: data);
    return StepModel.fromJson(response.data);
  }
}
