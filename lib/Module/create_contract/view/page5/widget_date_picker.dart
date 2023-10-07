import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class WidgetDateContractPicker extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final PickerType pickerType;
  final Function(JPickerValue)? onChange;
  const WidgetDateContractPicker(
      {super.key,
      required this.pickerType,
      this.onChange,
      required this.textController,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showGlobalDatePicker(
          context: context,
          startDate: JDateModel(jhijri: JHijri.now()),
          selectedDate: JDateModel(jhijri: JHijri.now()),
          pickerMode: DatePickerMode.day,
          pickerTheme: Theme.of(context),
          pickerType: pickerType,
          textDirection: TextDirection.rtl,
          buttons: Container(),
          onChange: onChange,
          primaryColor: LightThemeColors.primaryColor,
          calendarTextColor: LightThemeColors.bodyLargeColor,
          backgroundColor: LightThemeColors.white,
          borderRadius: const Radius.circular(10),
        );
      },
      child: CustomInput(
          controller: textController,
          hint: hint,
          textInputType: TextInputType.datetime,
          isEnabled: false,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
    );
  }
}
