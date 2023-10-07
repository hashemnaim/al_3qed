import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';

class WidgetDatePicker extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final bool isIcon;
  final PickerType pickerType;
  final Function(JPickerValue)? onChange;
  const WidgetDatePicker(
      {super.key,
      required this.pickerType,
      this.onChange,
      this.isIcon = true,
      required this.textController,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showGlobalDatePicker(
          context: context,
          startDate: JDateModel(
              jhijri: JHijri(
            fYear: 1357,
            fMonth: 1,
            fDay: 1,
          )),
          selectedDate: JDateModel(jhijri: JHijri.now()),
          pickerMode: DatePickerMode.year,
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
          icon: isIcon == true ? ImagePaths.date : null,
          formValidator: (value) =>
              ValidationHelper.validationHelper.validateNull(value)),
    );
  }
}
