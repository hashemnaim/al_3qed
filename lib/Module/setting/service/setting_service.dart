import 'dart:developer';

import 'package:al_3qed/Module/setting/model/bank_model.dart';
import 'package:al_3qed/Module/setting/model/common_questions_model.dart';
import 'package:al_3qed/Module/setting/model/contract_type_model.dart';
import 'package:al_3qed/Module/setting/model/list_item_model.dart';
import 'package:al_3qed/Module/setting/model/my_contract_model.dart';
import 'package:al_3qed/Module/setting/model/setting_model.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import '../../../core/helper/dio_helper.dart';
import '../model/contract_periods_model.dart';

class SettingService {
  static Future<ListItemModel> getCity() async {
    var response = await DioHelper.getData(AppApi.citiesUrl);
    return ListItemModel.fromJson(response.data);
  }

  static Future<ListItemModel> getRegions(int id) async {
    var response = await DioHelper.getData("${AppApi.regionsUrl}?city_id=$id");
    ListItemModel listItemModel = ListItemModel.fromJson(response.data);
    log(listItemModel.data.toString());
    return listItemModel;
  }

  static Future<String> getTerms() async {
    var response = await DioHelper.getData(AppApi.termsUrl);
    return response.data["data"]["description"];
  }

  static Future<String> getPrivacy() async {
    var response = await DioHelper.getData(AppApi.privacyUrl);
    return response.data["data"]["description"];
  }

  static Future<CommonQuestionsModel> getCommonQuestionsy() async {
    var response = await DioHelper.getData(AppApi.commonQuestionsUrl);
    return CommonQuestionsModel.fromJson(response.data);
  }

  static Future<BankModel> getBankAccounts() async {
    var response = await DioHelper.getData(AppApi.bankAccountsUrl);
    return BankModel.fromJson(response.data);
  }

  static Future<ContractTypeModel> getServicesPricing(
      String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.servicesPricingUrl}?contract_type=$contractType");
    return ContractTypeModel.fromJson(response.data);
  }

  static Future<ListItemModel> getPaperWork(String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.paperworUrl}?contract_type=$contractType");
    return ListItemModel.fromJson(response.data);
  }

  static Future<ListItemModel> getRealEstatType(String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.realEstatTypeUrl}?contract_type=$contractType");
    return ListItemModel.fromJson(response.data);
  }

  static Future<ListItemModel> getRealEstatUsage(String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.realEstatUsageUrl}?contract_type=$contractType");
    return ListItemModel.fromJson(response.data);
  }

  static Future<ListItemModel> getUnitsTypes(String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.unitsTypesUrl}?contract_type=$contractType");
    return ListItemModel.fromJson(response.data);
  }

  static Future<ListItemModel> getPaymentsType(String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.paymentsTypesUrl}?contract_type=$contractType");
    return ListItemModel.fromJson(response.data);
  }

  static Future<ContractPeriodsModel> getContractPeriods(
      String contractType) async {
    var response = await DioHelper.getData(
        "${AppApi.contractPeriodsUrl}?contract_type=$contractType");
    return ContractPeriodsModel.fromJson(response.data);
  }

  static Future<SettingsModel> getSettings() async {
    var response = await DioHelper.getData(AppApi.settingsUrl);
    return SettingsModel.fromJson(response.data);
  }

  static Future<MyContractModel> getContracts() async {
    var response = await DioHelper.getData(AppApi.contracts);
    return MyContractModel.fromJson(response.data);
  }
}
