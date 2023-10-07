import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_date_picker.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/extension.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_drop_down.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class WidgetOwnerData extends StatelessWidget {
  final CreateContractController controller;
  const WidgetOwnerData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.ownerData,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SpaceH10(),
        CustomInput(
            controller: controller.onwerIdNoController,
            hint: AppString.onwerIdNo,
            textInputType: TextInputType.number,
            icon: ImagePaths.detail,
            formValidator: (value) =>
                ValidationHelper.validationHelper.validateNull(value)),
        const SpaceH10(),
        WidgetDatePicker(
          textController: controller.ownerDateAdController,
          hint: AppString.onwerDateAd,
          pickerType: PickerType.JNormal,
          onChange: (value) {
            controller.ownerDateAdController.text =
                value.date.toString().getDate();
            controller.ownerDateHijriController.text =
                JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                    .toString();
            controller.update();
            Navigator.pop(context);
          },
        ),
        const SpaceH10(),
        WidgetDatePicker(
          textController: controller.ownerDateHijriController,
          hint: AppString.onwerDateHijri,
          pickerType: PickerType.JHijri,
          onChange: (value) {
            controller.ownerDateHijriController.text =
                JHijri(fDate: value.date, fDisplay: DisplayFormat.YYYYMMDD)
                    .toString();
            controller.update();
            Navigator.pop(context);
          },
        ),
        const SpaceH10(),
        CustomPhoneInput(
          onCountryChange: (country) {},
          onValueChange: (value) {
            controller.ownerMobileHController.text = value;
          },
          controller: controller.ownerMobileHController,
        ),
        const SpaceH10(),
        Visibility(
          visible: controller.isOwnerDeceased != AppString.yes,
          child: Column(
            children: [
              CustomInput(
                  controller: controller.ownerIBANController,
                  hint: AppString.IBAN,
                  textLeading: "SA",
                  textAlign: TextAlign.end,
                  textInputType: TextInputType.text,
                  icon: ImagePaths.detail,
                  formValidator: (value) =>
                      ValidationHelper.validationHelper.validateNull(value)),
              const SpaceH10(),
              CustomDropDown(
                hint: controller.addLegalRepresentativeForOwner,
                onChanged: (item) =>
                    controller.setLegalRepresentativeForOwner(item!),
                itemsList: [
                  Item(name: AppString.yes, id: 0),
                  Item(name: AppString.no, id: 1),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
