import 'dart:developer';
import 'package:al_3qed/Module/setting/model/bank_model.dart';
import 'package:al_3qed/Module/setting/model/common_questions_model.dart';
import 'package:al_3qed/Module/setting/model/contract_periods_model.dart';
import 'package:al_3qed/Module/setting/model/contract_type_model.dart';
import 'package:al_3qed/Module/setting/model/list_item_model.dart';
import 'package:al_3qed/Module/setting/model/my_contract_model.dart';
import 'package:al_3qed/Module/setting/model/setting_model.dart';
import 'package:al_3qed/Module/setting/service/setting_service.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool isExpansionChanged = false.obs;
  RxInt indexExpansionChanged = 0.obs;
  RxString termsModel = "".obs;
  RxString privacyModel = "".obs;
  Rx<ListItemModel> cityModel = ListItemModel().obs;
  Rx<ListItemModel> paperWorkModel = ListItemModel().obs;
  Rx<ListItemModel> realEstatTypeModel = ListItemModel().obs;
  Rx<ListItemModel> realEstatUsageModel = ListItemModel().obs;
  Rx<ListItemModel> unitsTypesModel = ListItemModel().obs;
  Rx<ListItemModel> paymentsTypeModel = ListItemModel().obs;
  Rx<SettingsModel> settingsModel = SettingsModel().obs;
  Rx<ContractPeriodsModel> contractPeriodsModel = ContractPeriodsModel().obs;
  Rx<CommonQuestionsModel> commonQuestionsyModel = CommonQuestionsModel().obs;
  Rx<BankModel> bankModel = BankModel().obs;
  Rx<ContractTypeModel> servicesPricingModel = ContractTypeModel().obs;
  Rx<MyContractModel> myContractModel = MyContractModel().obs;

  getCity() async {
    cityModel.value = await SettingService.getCity();
    log("getCity ================> ${cityModel.toJson().toString()}");
  }

  getTerms() async {
    termsModel.value = await SettingService.getTerms();
    log("getTerms ================> ${termsModel.toString()}");
  }

  getPrivacy() async {
    privacyModel.value = await SettingService.getPrivacy();
    log("getPrivacy ================> ${privacyModel.toString()}");
  }

  getCommonQuestionsy() async {
    commonQuestionsyModel.value = await SettingService.getCommonQuestionsy();
    log("getCommonQuestionsy ================> ${commonQuestionsyModel.toJson().toString()}");
  }

  getBankAccounts() async {
    bankModel.value = await SettingService.getBankAccounts();
    log("getBankAccounts ================> ${bankModel.toJson().toString()}");
  }

  getServicesPricing(String contractType) async {
    servicesPricingModel.value =
        await SettingService.getServicesPricing(contractType);
    log("getServicesPricing ================> ${servicesPricingModel.toJson().toString()}");
  }

  getPaperWork(String contractType) async {
    paperWorkModel.value = await SettingService.getPaperWork(contractType);
    log("paperWorkodel ================> ${paperWorkModel.toJson().toString()}");
  }

  getRealEstatType(String contractType) async {
    realEstatTypeModel.value =
        await SettingService.getRealEstatType(contractType);
    log("getRealEstatType ================> ${realEstatTypeModel.toJson().toString()}");
  }

  getRealEstatUsage(String contractType) async {
    realEstatUsageModel.value =
        await SettingService.getRealEstatUsage(contractType);
    log("getRealEstatUsage ================> ${realEstatUsageModel.toJson().toString()}");
  }

  getUnitsTypes(String contractType) async {
    unitsTypesModel.value = await SettingService.getUnitsTypes(contractType);
    log("unitsTypesModel ================> ${unitsTypesModel.toJson().toString()}");
  }

  getPaymentsType(String contractType) async {
    paymentsTypeModel.value =
        await SettingService.getPaymentsType(contractType);
    log("paymentsTypeModel ================> ${paymentsTypeModel.toJson().toString()}");
  }

  getContractPeriods(String contractType) async {
    contractPeriodsModel.value =
        await SettingService.getContractPeriods(contractType);
    log("contractPeriodsModel ================> ${contractPeriodsModel.toJson().toString()}");
  }

  getSettings() async {
    settingsModel.value = await SettingService.getSettings();
    log("settingsModel ================> ${settingsModel.toJson().toString()}");
  }

  getContracts() async {
    myContractModel.value = await SettingService.getContracts();
    log("myContractModel ================> ${myContractModel.toJson().toString()}");
  }

  initCreateContract(String contractType) async {
    showOrHideLoading(false, "GETTING_INFO".tr);

    await getServicesPricing(contractType);
    await getPaperWork(contractType);
    await getRealEstatType(contractType);
    await getRealEstatUsage(contractType);
    await getUnitsTypes(contractType);
    await getPaymentsType(contractType);
    await getContractPeriods(contractType);

    showOrHideLoading(true, "GETTING_INFO".tr);
  }

  @override
  void onInit() async {
    await getTerms();
    await getPrivacy();
    await getCommonQuestionsy();
    await getSettings();
    await getBankAccounts();
    await getCity();
    await getContracts();
    super.onInit();
  }
}
