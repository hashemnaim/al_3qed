import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_date_picker.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/extension.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class WidgetAgentTenantData extends StatelessWidget {
  final CreateContractController controller;
  const WidgetAgentTenantData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Divider(color: Colors.grey[300], height: 20.h),
      Text(
        AppString.agentInformation,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SpaceH10(),
      CustomInput(
          controller: controller.agentIdTenantController,
          hint: AppString.agentId,
          textInputType: TextInputType.number,
          icon: ImagePaths.detail,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
      const SpaceH10(),
      WidgetDatePicker(
        textController: controller.agentDateAdTenantController,
        hint: AppString.agentDateAd,
        pickerType: PickerType.JNormal,
        onChange: (value) {
          controller.agentDateAdTenantController.text =
              value.date.toString().getDate();
          controller.agentDataHijriTenantController.text =
              JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                  .toString();
          controller.update();
          Get.back();
        },
      ),
      const SpaceH10(),
      WidgetDatePicker(
        textController: controller.agentDataHijriTenantController,
        hint: AppString.agentDateHijri,
        pickerType: PickerType.JHijri,
        onChange: (value) {
          controller.agentDataHijriTenantController.text =
              JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                  .toString();
          controller.update();
          Get.back();
        },
      ),
      const SpaceH10(),
      CustomInput(
          controller: controller.agentmobileTenantController,
          hint: AppString.agentMoile,
          textInputType: TextInputType.number,
          icon: ImagePaths.call,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
      const SpaceH10(),
      CustomInput(
          controller: controller.agencyNoInstrumentTenantController,
          hint: AppString.agencyNoInstrument,
          textInputType: TextInputType.text,
          icon: ImagePaths.detail,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
      const SpaceH10(),
      WidgetDatePicker(
        textController: controller.agencyDateInstrumentTenantController,
        hint: AppString.agencyDateInstrument,
        pickerType: PickerType.JNormal,
        onChange: (value) {
          controller.agencyDateInstrumentTenantController.text =
              JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                  .toString();
          controller.update();
          Get.back();
        },
      ),
      const SpaceH10(),
    ]);
  }
}
