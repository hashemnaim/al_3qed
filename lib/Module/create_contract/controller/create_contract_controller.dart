import 'dart:developer';
import 'dart:io';

import 'package:al_3qed/Module/create_contract/model/step1_model.dart';
import 'package:al_3qed/Module/create_contract/model/step_model.dart';
import 'package:al_3qed/Module/create_contract/service/create_contract_service.dart';
import 'package:al_3qed/Module/home/controller/home_controller.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/Module/setting/model/list_item_model.dart';
import 'package:al_3qed/Module/setting/service/setting_service.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/helper/image_helper.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class CreateContractController extends GetxController {
  int indexPage = 1;
  PageController? controller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SettingController settingController = Get.find();
  GlobalKey<FormState> onwerDataformKey = GlobalKey<FormState>();

  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> formKey4 = GlobalKey<FormState>();

  String partCreateContact = AppString.founderContract;
  String typeInstrument = AppString.chooseTypeInstrument;
  String isOwnerDeceased = AppString.isOwnerDeceased;
  String addLegalRepresentativeForOwner =
      AppString.addLegalRepresentativeforOwner;
  String addLegalRepresentativeForTenant =
      AppString.addLegalRepresentativeForTenant;
  String tenantEntity = AppString.tenantEntity;
  Item delegationType = Item(name: AppString.delegationType, id: 100);
  HomeController homeController = Get.find();
  //Page1
  DataStep1 step1model = DataStep1();
  RxString imageInstrumenTenant = "".obs;
  RxString imageTenant = "".obs;
  String imageArgument = "";
  Item cityItem = Item(name: AppString.city, id: 0);
  Item regionsItem = Item(name: AppString.district, id: 0);
  Item cityTenantItem = Item(name: AppString.city, id: 0);
  Item regionsTenantItem = Item(name: AppString.district, id: 0);
  Item propertyTypeItem = Item(name: AppString.propertyType, id: 0);
  Item propertyUseItem = Item(name: AppString.propertyUse, id: 0);
  Item paymentMethodItem = Item(name: AppString.paymentMethod, id: 0);
  Rx<ListItemModel> regionsModel = ListItemModel().obs;

  Rx<ListItemModel> regionsTenantModel = ListItemModel().obs;
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController buildingNoController = TextEditingController();
  TextEditingController zipCodController = TextEditingController();
  TextEditingController extraNoController = TextEditingController();
  TextEditingController instrumenNoController = TextEditingController();

  //Page2
  //instrumen
  TextEditingController instrumenDataController = TextEditingController();
  //onwer
  TextEditingController onwerIdNoController = TextEditingController();
  TextEditingController ownerDateAdController = TextEditingController();
  TextEditingController ownerDateHijriController = TextEditingController();
  TextEditingController ownerMobileHController = TextEditingController();
  TextEditingController ownerIBANController = TextEditingController();
  //agentForOwner
  TextEditingController agentIdController = TextEditingController();
  TextEditingController agentDateAdController = TextEditingController();
  TextEditingController agentDateHijriController = TextEditingController();
  TextEditingController agentmobileController = TextEditingController();
  TextEditingController agencyNoInstrumentController = TextEditingController();
  TextEditingController agencyDateInstrumentController =
      TextEditingController();
  TextEditingController agenIBANController = TextEditingController();
  //Tenant
  TextEditingController tenantIdNoController = TextEditingController();
  TextEditingController tenantDateAdController = TextEditingController();
  TextEditingController tenantDateHijriController = TextEditingController();
  TextEditingController tenantMobileController = TextEditingController();

  //agentForTenant
  TextEditingController agentIdTenantController = TextEditingController();
  TextEditingController agentDateAdTenantController = TextEditingController();
  TextEditingController agentDataHijriTenantController =
      TextEditingController();
  TextEditingController agentmobileTenantController = TextEditingController();
  TextEditingController agencyNoInstrumentTenantController =
      TextEditingController();
  TextEditingController agencyDateInstrumentTenantController =
      TextEditingController();

  //page3
  RxString imageInstrumen = "".obs;
  TextEditingController unifiedRegistrationNoController =
      TextEditingController();
  TextEditingController areaPasronController = TextEditingController();
  TextEditingController cityPasronController = TextEditingController();
  TextEditingController areaCompanyController = TextEditingController();
  TextEditingController cityCompanyController = TextEditingController();

  //page4
  TextEditingController unitNumberController = TextEditingController();
  Item unitTypeItem = Item(name: AppString.unitType, id: 0);
  TextEditingController numberRoomsController = TextEditingController();
  TextEditingController unitUseController = TextEditingController();
  TextEditingController flooNumbereController = TextEditingController();
  TextEditingController unitAreaController = TextEditingController();
  TextEditingController electricityMeterNumberController =
      TextEditingController();
  TextEditingController waterMeterNumberController = TextEditingController();
  TextEditingController numberAirConditionersUnitController =
      TextEditingController();

  //Page5
  bool isConditions = true;
  bool freePremiuMmembership = false;
  TextEditingController contractStartingDateController =
      TextEditingController();
  TextEditingController contractTermInYears = TextEditingController();
  TextEditingController annualRentalAmounUnitController =
      TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();

  Item dailyFine = Item(name: AppString.dailyFine, id: -1);

  // String dailyFine = AppString.dailyFine;
  TextEditingController subDelayController = TextEditingController();
  TextEditingController wouldAddConditionsController = TextEditingController();

  Future<StepModel> setStep1() async {
    dio.MultipartFile? images;

    if (typeInstrument != AppString.electronicInstrument) {
      dio.MultipartFile? images =
          await ImageHelper.helper.compressFile(File(imageArgument));
      log(images.toString());
    }

    Map<String, dynamic> data = {
      "id": 1,
      "contract_ownership":
          partCreateContact == AppString.owner ? "owner" : "tenant",
      "instrument_type": typeInstrument == AppString.electronicInstrument
          ? "electronic"
          : typeInstrument == AppString.ancientHandwrittenInstrument
              ? "old_handwritten"
              : "strong_argument",
      "instrument_number": instrumenNoController.text,
      "instrument_history": instrumenDataController.text,
      "old_handwritten_photo":
          typeInstrument == AppString.ancientHandwrittenInstrument
              ? images ?? ""
              : "",
      "strong_argument_photo":
          typeInstrument == AppString.argumentConsistency ? images ?? "" : "",
      "property_owner_is_deceased":
          isOwnerDeceased == AppString.yesDeceased ? 0 : 1,
      "property_type_id": propertyTypeItem.id,
      "property_usages_id": propertyUseItem.id,
      "property_region_id": regionsItem.id,
      "property_city_id": cityItem.id,
      "neighborhood": neighborhoodController.text,
      "building_number": buildingNoController.text,
      "postal_code": zipCodController.text,
      "extra_figure": extraNoController.text,
    };

    dio.FormData formData = dio.FormData.fromMap(data);

    log("setStep1 ================> ${data.toString()}");
    return await CreateContractService.setStep1(formData);
  }

  Future<StepModel> setStep2() async {
    dio.MultipartFile? images;
    if (delegationType.id == 1) {
      dio.MultipartFile? images =
          await ImageHelper.helper.compressFile(File(imageTenant.value));
      log(images.toString());
    }

    Map<String, dynamic> data = {
      "id": 1,
      "property_owner_id_num": onwerIdNoController.text,
      "property_owner_dob_gregorian": ownerDateAdController.text,
      "property_owner_dob_hijri": ownerDateHijriController.text,
      "property_owner_mobile": ownerMobileHController.text,
      "property_owner_iban": ownerIBANController.text,
      "add_legal_agent_of_owner":
          addLegalRepresentativeForOwner == AppString.yes ? 1 : 0,
      "id_num_of_property_owner_agent": agentIdController.text,
      "dob_gregorian_of_property_owner_agent": agentDateAdController.text,
      "dob_hijri_of_property_owner_agent": agentDateHijriController.text,
      "mobile_of_property_owner_agent": agentmobileController.text,
      "agency_number_in_instrument_of_property_owner":
          agencyNoInstrumentController.text,
      "agency_instrument_date_of_property_owner":
          agencyDateInstrumentController.text,
      // "agent_iban_of_property_owner": agenIBANController.text,
      "tenant_id_num": tenantIdNoController.text,
      // "property_usages_id": 1,
      "tenant_dob_gregorian": tenantDateAdController.text,
      "tenant_dob_hijri": tenantDateHijriController.text,
      "tenant_mobile": tenantMobileController.text,

      "tenant_entity": tenantEntity,
      "tenant_entity_unified_registry_number":
          unifiedRegistrationNoController.text,
      "tenant_entity_city_id": cityTenantItem.id,

      "tenant_entity_region_id": regionsItem.id,
      "authorization_type": delegationType.id == 0
          ? "owner_and_representative_of_record"
          : "agent_for_the_tenant",
      "copy_of_the_authorization_or_agency": images,
      "add_legal_agent_of_tenant":
          addLegalRepresentativeForTenant == AppString.yes ? 1 : 0,
      "id_num_of_property_tenant_agent": agentIdTenantController.text,
      "dob_gregorian_of_property_tenant_agent":
          agentDateAdTenantController.text,
      "dob_hijri_of_property_tenant_agent": agentDataHijriTenantController.text,
      "mobile_of_property_tenant_agent": agentmobileTenantController.text,
      "agency_number_in_instrument_of_property_tenant":
          agencyNoInstrumentTenantController.text,
      "agency_instrument_date_of_property_tenant":
          agencyDateInstrumentTenantController.text,
    };
    log("setStep2 ================> ${data.toString()}");

    return await CreateContractService.setStep2(data);
  }

  Future<StepModel> setStep4() async {
    Map<String, dynamic> data = {
      "id": 1,
      "unit_number": unitNumberController.text,
      "unit_type_id": unitTypeItem.id,
      "tootal_rooms": numberRoomsController.text,
      "unit_usage": unitUseController.text,
      "floor_number": flooNumbereController.text,
      "unit_area": unitAreaController.text,
      "electricity_meter_number": electricityMeterNumberController.text,
      "water_meter_number": waterMeterNumberController.text,
      "number_of_unit_air_conditioners":
          numberAirConditionersUnitController.text,
    };
    log("setStep4 ================> ${data.toString()}");

    return await CreateContractService.setStep4(data);
  }

  Future<StepModel> setStep5() async {
    Map<String, dynamic> data = {
      "id": 1,
      "contract_starting_date": contractStartingDateController.text,
      "contract_term_in_years": contractTermInYears.text,
      "annual_rent_amount_for_the_unit": annualRentalAmounUnitController.text,
      "payment_type_id": paymentMethodItem.id,
      "sub_delay": dailyFine.id,
      "premium_membership_for_free": freePremiuMmembership == true ? 1 : 0,
      "daily_fine": subDelayController.text,
      "other_conditions": wouldAddConditionsController.text,
    };
    log("setStep5 ================> ${data.toString()}");

    return await CreateContractService.setStep5(data);
  }

//Through it, it is chosen whether the contract is for the owner or the tenant
  choosePartCreateContact(Item item) {
    partCreateContact = item.name!;
    update();
  }

  chooseCity(Item item) async {
    cityItem = item;
    regionsModel.value = await SettingService.getRegions(cityItem.id!);
    regionsItem = Item(
        name: regionsModel.value.data![0].name,
        id: regionsModel.value.data![0].id);
    update();
  }

  chooseRegionsItem(Item item) {
    regionsItem = item;
    update();
  }

  chooseCityTenant(Item item) async {
    cityTenantItem = item;
    regionsTenantModel.value = await SettingService.getRegions(cityItem.id!);
    regionsTenantItem = Item(
        name: regionsTenantModel.value.data![0].name,
        id: regionsTenantModel.value.data![0].id);
    update();
  }

  chooseRegionsTenantItem(Item item) {
    regionsTenantItem = item;
    update();
  }

  choosePropertyType(Item item) {
    propertyTypeItem = item;
    update();
  }

  choosePaymentMethod(Item item) {
    paymentMethodItem = item;
    update();
  }

  choosepropertyUse(Item item) {
    propertyUseItem = item;
    update();
  }

  //Choose the type of instrument (صك الكتروني)
  chooseTypeInstrument(Item item) {
    typeInstrument = item.name!;
    update();
  }

//Whether the owner of the property is deceased or not
  chooseisOwnerDeceased(Item item) {
    isOwnerDeceased = item.name!;
    update();
  }

//If you want to add an agent or not
  setLegalRepresentativeForOwner(Item item) {
    addLegalRepresentativeForOwner = item.name!;
    update();
  }

//If you want to add an agent or not fot tenant
  setDelegationType(Item item) {
    delegationType = item;
    update();
  }

  setLegalRepresentativeForTenant(Item item) {
    addLegalRepresentativeForTenant = item.name!;
    update();
  }

//If you want to add an agent or not fot tenant
  setdailyFine(Item item) {
    dailyFine = item;
    update();
  }

  setTenantEntity(Item item) {
    tenantEntity = item.name!;
    update();
  }

//If you want to add an agent or not
  setUnitType(Item item) {
    unitTypeItem = item;
    update();
  }

  previousPage() {
    controller!.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    indexPage = indexPage - 1;
    update(["changePage"]);
  }

  bool isNext() {
    return typeInstrument != AppString.chooseTypeInstrument &&
        isOwnerDeceased != AppString.isOwnerDeceased;
  }

  nextPage() {
    controller!.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    indexPage = indexPage + 1;
    update(["changePage"]);
  }

  uploadeImage() async {
    String file = await ImageHelper.helper.pickImage() ?? "";
    imageArgument = file;
    update();
  }

  isNextPage(int page) async {
    switch (page) {
      case 0:
        if (isNext() == false) {
          showSnackBar(
            message: "يجب اضافة كافة البيانات",
            type: ToastType.DANGER,
          );
        } else if (typeInstrument != AppString.electronicInstrument &&
            imageArgument == "") {
          showSnackBar(
            message: "يجب رفع الصورة المطلوبة",
            type: ToastType.DANGER,
          );
        } else {
          if (formKey.currentState!.validate()) {
            showOrHideLoading(false, "GETTING_INFO".tr);

            StepModel step1 = await setStep1();
            showOrHideLoading(true, "GETTING_INFO".tr);

            if (step1.success == false) {
              showToast("هنالك مشكلة", step1.message!, ToastType.DANGER);
            } else {
              nextPage();
            }
          }
          // nextPage();
        }
        break; // The switch statement must be told to exit, or it will execute every case.
      case 1:
        if (onwerDataformKey.currentState!.validate()) {
          if (tenantEntity == AppString.tenantEntity) {
            showSnackBar(
              message: "يجب اضافة كافة البيانات",
              type: ToastType.DANGER,
            );
          }
          showOrHideLoading(false, "GETTING_INFO".tr);

          StepModel step2 = await setStep2();
          showOrHideLoading(true, "GETTING_INFO".tr);

          if (step2.success == false) {
            showToast("هنالك مشكلة", step2.message!, ToastType.DANGER);
          } else {
            nextPage();
          }
        }
        // nextPage();

        break;
      case 2:
        if (formKey3.currentState!.validate()) {
          showOrHideLoading(false, "GETTING_INFO".tr);

          StepModel step4 = await setStep4();
          showOrHideLoading(true, "GETTING_INFO".tr);

          if (step4.success == false) {
            showToast("هنالك مشكلة", step4.message!, ToastType.DANGER);
          } else {
            nextPage();
          }
        }

        break;
      case 3:
        if (paymentMethodItem.id == 0) {
          showSnackBar(
            message: "يجب اضافة كافة البيانات",
            type: ToastType.DANGER,
          );
        }
        if (formKey4.currentState!.validate()) {
          showOrHideLoading(false, "GETTING_INFO".tr);

          StepModel step5 = await setStep5();
          showOrHideLoading(true, "GETTING_INFO".tr);

          if (step5.success == false) {
            showSnackBar(
              message: step5.message!,
              type: ToastType.DANGER,
            );
            // showToast("هنالك مشكلة", step5.message!, ToastType.DANGER);
          } else {
            Get.offNamed(
              AppRoutes.paymentContractScreen,
            );
          }
        }

        break;

      default:
    }
  }

  getDataStep(int id, int step) async {
    switch (step) {
      case 1:
        dynamic respoance = await CreateContractService.uncompletedContract(
            {"id": id, "step": step});

        step1model = Step1Model.fromJson(respoance).data!;
        log(step1model.toJson().toString());
        update();
        // nextPage();

        break; // The switch statement must be told to exit, or it will execute every case.

      default:
    }
  }

  @override
  void onInit() async {
    int id = Get.arguments['id'] ?? 0;
    int step = Get.arguments['step'] ?? 0;
    log(id.toString());

    controller = PageController(initialPage: step - 1);
    indexPage = step;
    await getDataStep(id, step);
    log(id.toString());

    super.onInit();
  }

  @override
  void dispose() {
    controller!.dispose();

    super.dispose();
  }
}
