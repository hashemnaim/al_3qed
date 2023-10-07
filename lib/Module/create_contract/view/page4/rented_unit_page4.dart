import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentedUnitDataPage4 extends StatelessWidget {
  const RentedUnitDataPage4({super.key});

  @override
  Widget build(BuildContext context) {
    Get.arguments['title'] ?? "";
    SettingController settingController = Get.find();

    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      child: Container(
        decoration:
            BoxDecoration(color: const Color(0xffF2F2F2).withOpacity(0.5)),
        child: GetBuilder<CreateContractController>(
          builder: (controller) {
            return Form(
              key: controller.formKey3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropDown(
                        hint: controller.unitTypeItem.name,
                        onChanged: (item) => controller.setUnitType(item!),
                        itemsList: [
                          ...settingController.unitsTypesModel.value.data!
                        ],
                      ),
                      const SpaceH10(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInput(
                                hint: AppString.unitNumber,
                                controller: controller.unitNumberController,
                                textInputType: TextInputType.text,
                                formValidator: (value) => ValidationHelper
                                    .validationHelper
                                    .validateNull(value)),
                          ),
                          const SpaceW4(),
                          Expanded(
                            child: CustomInput(
                                hint: AppString.flooNumber,
                                controller: controller.flooNumbereController,
                                textInputType: TextInputType.number,
                                formValidator: (value) => ValidationHelper
                                    .validationHelper
                                    .validateNull(value)),
                          ),
                        ],
                      ),
                      const SpaceH10(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInput(
                                hint: AppString.unitArea,
                                controller: controller.unitAreaController,
                                textInputType: TextInputType.text,
                                formValidator: (value) => ValidationHelper
                                    .validationHelper
                                    .validateNull(value)),
                          ),
                          const SpaceW4(),
                          Expanded(
                            child: CustomInput(
                                hint: AppString.numberRooms,
                                controller: controller.numberRoomsController,
                                textInputType: TextInputType.number,
                                formValidator: (value) => ValidationHelper
                                    .validationHelper
                                    .validateNull(value)),
                          ),
                        ],
                      ),
                      const SpaceH10(),
                      CustomInput(
                          hint: AppString.unitUse,
                          controller: controller.unitUseController,
                          textInputType: TextInputType.text,
                          formValidator: (value) => ValidationHelper
                              .validationHelper
                              .validateNull(value)),
                      const SpaceH10(),
                      CustomInput(
                        hint: AppString.electricityMeterNumber,
                        controller: controller.electricityMeterNumberController,
                        trailingIcon: true,
                        textInputType: TextInputType.number,
                      ),
                      const SpaceH10(),
                      CustomInput(
                        hint: AppString.waterMeterNumber,
                        controller: controller.waterMeterNumberController,
                        textInputType: TextInputType.number,
                        trailingIcon: true,
                      ),
                      const SpaceH10(),
                      CustomInput(
                        hint: AppString.numberAirConditionersUnit,
                        controller:
                            controller.numberAirConditionersUnitController,
                        trailingIcon: true,
                        textInputType: TextInputType.number,
                      )
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
