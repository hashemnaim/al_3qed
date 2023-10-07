import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_date_picker.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_upload_image.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';
import '../../../setting/controller/setting_controller.dart';

class InstrumenDataPage1 extends StatelessWidget {
  const InstrumenDataPage1({super.key});
  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      child: GetBuilder<CreateContractController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDown(
                      hint: controller.step1model.contractOwnership ??
                          controller.partCreateContact,
                      onChanged: (item) =>
                          controller.choosePartCreateContact(item!),
                      itemsList: [
                        Item(name: AppString.owner, id: 0),
                        Item(name: AppString.tenant, id: 1),
                      ],
                    ),
                    const SpaceH10(),
                    CustomDropDown(
                      hint: controller.step1model.instrumentType ??
                          controller.typeInstrument,
                      onChanged: (item) =>
                          controller.chooseTypeInstrument(item!),
                      itemsList: [
                        Item(name: AppString.electronicInstrument, id: 0),
                        Item(
                            name: AppString.ancientHandwrittenInstrument,
                            id: 1),
                        Item(name: AppString.argumentConsistency, id: 2),
                      ],
                    ),
                    getWidgetTypeinstrumen(
                        controller.typeInstrument, controller),
                    const SpaceH10(),
                    CustomDropDown(
                      hint: controller.step1model.propertyOwnerIsDeceased ==
                              null
                          ? (controller.step1model.propertyOwnerIsDeceased ==
                                  false
                              ? AppString.yesDeceased
                              : AppString.noAlive)
                          : controller.isOwnerDeceased,
                      onChanged: (item) =>
                          controller.chooseisOwnerDeceased(item!),
                      itemsList: [
                        Item(name: AppString.yesDeceased, id: 0),
                        Item(name: AppString.noAlive, id: 1),
                      ],
                    ),
                    Visibility(
                        visible: controller.isNext(),
                        child: Column(children: [
                          const SpaceH10(),
                          Row(
                            children: [
                              Expanded(
                                  child: CustomDropDown(
                                hint: controller.step1model.propertyTypeId
                                    .toString(),
                                //  == null
                                //     ? controller.propertyTypeItem.name
                                //     : settingController.realEstatTypeModel
                                //             .value.data![1].name ??
                                //         controller.propertyTypeItem.name,
                                onChanged: (item) =>
                                    controller.choosePropertyType(item!),
                                itemsList: [
                                  ...settingController
                                      .realEstatTypeModel.value.data!
                                ],
                              )),
                              const SpaceW8(),
                              Expanded(
                                child: CustomDropDown(
                                  hint: controller.step1model.propertyUsagesId
                                      .toString(),
                                  //  ==
                                  //         null
                                  //     ? controller.propertyUseItem.name
                                  //     : settingController
                                  //             .realEstatUsageModel
                                  //             .value
                                  //             .data![1]
                                  //             .name ??
                                  //         controller.propertyUseItem.name,
                                  onChanged: (item) =>
                                      controller.choosepropertyUse(item!),
                                  itemsList: [
                                    ...settingController
                                        .realEstatUsageModel.value.data!
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SpaceH10(),
                          Row(
                            children: [
                              Expanded(
                                child: CustomDropDown(
                                  hint: controller.step1model.propertyCityId
                                      .toString(),
                                  // ==
                                  //         null
                                  //     ? controller.cityItem.name
                                  //     : settingController
                                  //             .cityModel
                                  //             .value
                                  //             .data![controller.step1model
                                  //                     .propertyCityId ??
                                  //                 0]
                                  //             .name ??
                                  //         controller.cityItem.name,
                                  onChanged: (item) =>
                                      controller.chooseCity(item!),
                                  itemsList: [
                                    ...settingController.cityModel.value.data!
                                  ],
                                ),
                              ),
                              const SpaceW8(),
                              Expanded(
                                child: Obx(() => CustomDropDown(
                                      hint: controller.step1model
                                                  .propertyRegionId ==
                                              null
                                          ? controller.regionsItem.name
                                          : controller
                                                  .regionsModel
                                                  .value
                                                  .data![controller.step1model
                                                          .propertyRegionId ??
                                                      0]
                                                  .name ??
                                              controller.regionsItem.name,
                                      onChanged: (item) =>
                                          controller.chooseRegionsItem(item!),
                                      itemsList:
                                          controller.regionsModel.value.data ==
                                                  null
                                              ? []
                                              : [
                                                  ...controller
                                                      .regionsModel.value.data!
                                                ],
                                    )),
                              ),
                            ],
                          ),
                          const SpaceH10(),
                          Row(
                            children: [
                              Expanded(
                                child: CustomInput(
                                    hint: controller.step1model.neighborhood ??
                                        AppString.district,
                                    controller:
                                        controller.neighborhoodController,
                                    textInputType: TextInputType.text,
                                    formValidator: (value) => ValidationHelper
                                        .validationHelper
                                        .validateNull(value)),
                              ),
                              const SpaceW8(),
                              Expanded(
                                child: CustomInput(
                                    hint:
                                        controller.step1model.buildingNumber ??
                                            AppString.buildingNo,
                                    controller: controller.buildingNoController,
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
                                    hint: controller.step1model.postalCode ??
                                        AppString.zipCod,
                                    controller: controller.zipCodController,
                                    textInputType: TextInputType.text,
                                    formValidator: (value) => ValidationHelper
                                        .validationHelper
                                        .validateNull(value)),
                              ),
                              const SpaceW8(),
                              Expanded(
                                  child: CustomInput(
                                      hint: controller.step1model.extraFigure ??
                                          AppString.extraNo,
                                      controller: controller.extraNoController,
                                      textInputType: TextInputType.number,
                                      formValidator: (value) => ValidationHelper
                                          .validationHelper
                                          .validateNull(value))),
                            ],
                          ),
                        ]))
                  ]),
            ),
          );
        },
      ),
    );
  }

  Widget getWidgetTypeinstrumen(
      String text, CreateContractController controller) {
    Map<String, Widget> listTypeinstrumen = {
      AppString.electronicInstrument: Column(children: [
        const SpaceH10(),
        CustomInput(
          hint: AppString.instrumenNo,
          controller: controller.instrumenNoController,
          textInputType: TextInputType.text,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value),
        ),
        const SpaceH10(),
        WidgetDatePicker(
            textController: controller.instrumenDataController,
            hint: AppString.dateHijri,
            isIcon: false,
            pickerType: PickerType.JHijri,
            onChange: (value) {
              controller.instrumenDataController.text =
                  JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                      .toString();
              controller.update();
              Get.back();
            }),
      ]),
      AppString.ancientHandwrittenInstrument: WidgetUploadImage(
        title: AppString.addTaxonPrice,
        buttonText: AppString.imageInstrumen,
        notImage: controller.imageArgument == "" ? true : false,
        onTap: () async {
          controller.uploadeImage();
        },
      ),
      AppString.argumentConsistency: WidgetUploadImage(
          title: AppString.addTaxonPrice,
          buttonText: AppString.imageInstrumen,
          notImage: controller.imageArgument == "" ? true : false,
          onTap: () async {
            controller.uploadeImage();
          }),
    };
    return listTypeinstrumen[text] ?? Container();
  }
}
