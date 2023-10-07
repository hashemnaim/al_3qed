import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page5/widget/widget_show_dialog.dart';
import 'package:al_3qed/Module/create_contract/view/page5/widget_date_picker.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/extension.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class FinancialStatementsPage5 extends StatelessWidget {
  const FinancialStatementsPage5({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();

    Get.arguments['title'] ?? "";
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      child: Container(
        decoration:
            BoxDecoration(color: const Color(0xffF2F2F2).withOpacity(0.5)),
        child: GetBuilder<CreateContractController>(
          builder: (controller) {
            return Form(
                key: controller.formKey4,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetDateContractPicker(
                        textController:
                            controller.contractStartingDateController,
                        hint: AppString.contractStartingDate,
                        pickerType: PickerType.JNormal,
                        onChange: (value) {
                          controller.contractStartingDateController.text =
                              value.date.toString().getDate();
                          controller.contractStartingDateController.text =
                              JHijri(
                                      fDate: value.date,
                                      fDisplay: DisplayFormat.YYYYMMDD)
                                  .toString();
                          controller.update();
                          Navigator.pop(context);
                        },
                      ),
                      const SpaceH10(),
                      CustomInput(
                          hint: AppString.durationContractYear,
                          controller: controller.contractTermInYears,
                          textInputType: TextInputType.number,
                          trailing: InkWell(
                            onTap: () {
                              clarificationDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(AppString.clarification,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color:
                                              LightThemeColors.primaryColor)),
                            ),
                          ),
                          formValidator: (value) => ValidationHelper
                              .validationHelper
                              .validateNull(value)),
                      const SpaceH10(),
                      CustomInput(
                          hint: AppString.annualRentalAmounUnit,
                          controller:
                              controller.annualRentalAmounUnitController,
                          textInputType: TextInputType.number,
                          formValidator: (value) => ValidationHelper
                              .validationHelper
                              .validateNull(value)),
                      const SpaceH10(),
                      Obx(() => CustomDropDown(
                            hint: controller.paymentMethodItem.name,
                            onChanged: (item) =>
                                controller.choosePaymentMethod(item!),
                            itemsList: [
                              ...settingController.paymentsTypeModel.value.data!
                            ],
                          )),

                      const SpaceH10(),

                      CustomDropDown(
                          hint: controller.dailyFine.name,
                          onChanged: (item) => controller.setdailyFine(item!),
                          itemsList: [
                            Item(name: AppString.no, id: 0),
                            Item(name: AppString.yes, id: 1),
                          ]),

                      // CustomInput(
                      //   hint: AppString.dailyFine,
                      //   controller: controller.dailyFineController,
                      //   textInputType: TextInputType.number,
                      //   trailingIcon: true,
                      // ),
                      const SpaceH10(),
                      CustomInput(
                        hint: AppString.subDelay.tr,
                        controller: controller.subDelayController,
                        textInputType: TextInputType.number,
                        trailingIcon: true,
                      ),
                      const SpaceH10(),
                      CustomInput(
                        hint: AppString.wouldLikeConditions,
                        controller: controller.wouldAddConditionsController,
                        trailingIcon: true,
                        textInputType: TextInputType.text,
                      ),
                      const SpaceH10(),
                      SizedBox(
                        width: 400,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                activeColor: LightThemeColors.buttonColor,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: controller.isConditions,
                                onChanged: (value) {
                                  // controller.isConditions = value!;
                                  // controller.update();
                                }),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    termsAndConditionsDialog(context);
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: "${AppString.isConditions} ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.grey[500]),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppString.privacyAndTrem,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: LightThemeColors
                                                        .buttonColor)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SpaceH10(),
                      SizedBox(
                        width: 400,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                activeColor: LightThemeColors.buttonColor,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: controller.freePremiuMmembership,
                                onChanged: (value) {
                                  controller.freePremiuMmembership = value!;
                                  controller.update();
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${AppString.freePremiuMmembership} ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.grey[500])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}
