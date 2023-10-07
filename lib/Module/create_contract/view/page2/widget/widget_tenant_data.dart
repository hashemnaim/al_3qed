import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_date_picker.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_upload_image.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/image_helper.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/extension.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class WidgetTenantData extends StatelessWidget {
  final CreateContractController controller;
  const WidgetTenantData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(AppString.tenantData, style: Theme.of(context).textTheme.bodyLarge),
      const SpaceH10(),
      CustomInput(
          controller: controller.tenantIdNoController,
          hint: AppString.tenantId,
          textInputType: TextInputType.number,
          icon: ImagePaths.detail,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
      const SpaceH10(),
      WidgetDatePicker(
          textController: controller.tenantDateAdController,
          hint: AppString.agentDateAd,
          pickerType: PickerType.JNormal,
          onChange: (value) {
            controller.tenantDateAdController.text =
                value.date.toString().getDate();
            controller.tenantDateHijriController.text =
                JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                    .toString();
            controller.update();
            Get.back();
          }),
      const SpaceH10(),
      WidgetDatePicker(
          textController: controller.tenantDateHijriController,
          hint: AppString.agentDateHijri,
          pickerType: PickerType.JHijri,
          onChange: (value) {
            controller.tenantDateHijriController.text =
                JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                    .toString();
            controller.update();
            Get.back();
          }),
      const SpaceH10(),
      CustomInput(
          controller: controller.tenantMobileController,
          hint: AppString.tenantMobile,
          textInputType: TextInputType.number,
          icon: ImagePaths.call,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
      const SpaceH10(),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomDropDown(
          hint: controller.tenantEntity,
          onChanged: (item) => controller.setTenantEntity(item!),
          itemsList: [
            Item(name: AppString.person, id: 0),
            Item(name: AppString.company, id: 1),
          ],
        ),
        Visibility(
            visible: controller.tenantEntity != AppString.tenantEntity,
            child: Column(children: [
              Visibility(
                visible: controller.tenantEntity == AppString.company,
                child: Column(
                  children: [
                    const SpaceH10(),
                    CustomInput(
                        hint: AppString.unifiedRegistrationNo,
                        controller: controller.unifiedRegistrationNoController,
                        textInputType: TextInputType.text,
                        formValidator: (value) => ValidationHelper
                            .validationHelper
                            .validateNull(value)),
                  ],
                ),
              ),
              const SpaceH10(),
              Row(
                children: [
                  Expanded(
                    child: CustomDropDown(
                      hint: controller.cityTenantItem.name,
                      onChanged: (item) => controller.chooseCityTenant(item!),
                      itemsList: [...settingController.cityModel.value.data!],
                    ),
                  ),
                  const SpaceW8(),
                  Expanded(
                    child: Obx(() => CustomDropDown(
                          hint: controller.regionsTenantItem.name,
                          onChanged: (item) =>
                              controller.chooseRegionsTenantItem(item!),
                          itemsList: controller.regionsModel.value.data == null
                              ? []
                              : [...controller.regionsModel.value.data!],
                        )),
                  ),
                ],
              ),

              // CustomInput(
              //     hint: AppString.city,
              //     controller: controller.cityPasronController,
              //     textInputType: TextInputType.text,
              //     icon: ImagePaths.location,
              //     formValidator: (value) =>
              //         ValidationHelper.validationHelper.validateNull(value)),
              // const SpaceH10(),
              // CustomInput(
              //     hint: AppString.area,
              //     controller: controller.areaPasronController,
              //     textInputType: TextInputType.text,
              //     icon: ImagePaths.location,
              //     formValidator: (value) =>
              //         ValidationHelper.validationHelper.validateNull(value)),

              Visibility(
                  visible: controller.tenantEntity == AppString.company,
                  child: Column(children: [
                    const SpaceH10(),
                    CustomDropDown(
                      hint: controller.delegationType.name,
                      onChanged: (item) {
                        controller.setDelegationType(item!);
                      },
                      itemsList: [
                        Item(name: AppString.ownerRepresentativeRecord, id: 0),
                        Item(name: AppString.agentForTenant, id: 1),
                      ],
                    ),
                    Visibility(
                      visible: controller.delegationType.name !=
                          AppString.delegationType,
                      child: Visibility(
                        visible: controller.delegationType.name ==
                            AppString.agentForTenant,
                        child: Column(
                          children: [
                            const SpaceH10(),
                            Obx(() => WidgetUploadImage(
                                  title: AppString.imageAgency,
                                  buttonText: AppString.imageAgency,
                                  notImage: controller.imageTenant.value == ""
                                      ? true
                                      : false,
                                  onTap: () async {
                                    String? file =
                                        await ImageHelper.helper.pickImage() ??
                                            "";
                                    controller.imageTenant.value = file;
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ])),
            ])),
      ]),
      const SpaceH10(),
      CustomDropDown(
          hint: controller.addLegalRepresentativeForTenant,
          onChanged: (item) =>
              controller.setLegalRepresentativeForTenant(item!),
          itemsList: [
            Item(name: AppString.yes, id: 0),
            Item(name: AppString.no, id: 1)
          ])
    ]);
  }
}
