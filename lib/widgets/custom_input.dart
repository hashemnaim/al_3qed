import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:extended_phone_number_input/phone_number_controller.dart';
import 'package:extended_phone_number_input/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl_phone_field/countries.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  CustomInput({
    Key? key,
    this.icon,
    this.isObscure,
    this.title = '',
    required this.hint,
    required this.textInputType,
    this.controller,
    this.formValidator,
    this.isEnabled = true,
    this.minLines = 1,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.trailing,
    this.trailingIcon = false,
    this.textLeading = '',
    this.onChange,
    this.autoFocus = false,
  }) : super(key: key);

  String? icon;
  bool? isObscure;
  String? title = '';
  String hint;
  String textLeading;
  TextInputType textInputType;
  TextEditingController? controller;
  FormFieldValidator? formValidator;
  TextAlign textAlign;
  bool? isEnabled;
  bool? trailingIcon;
  Widget? trailing;
  bool? autoFocus = false;
  int? minLines;
  Function()? onTap;
  Function(String)? onChange;
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isPasswordShow = true;

  showOrHidePassword() {
    setState(() {
      isPasswordShow = !isPasswordShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: widget.autoFocus ?? false,
        onTap: widget.onTap,
        onChanged: widget.onChange,
        minLines: widget.isObscure ?? false ? 1 : widget.minLines,
        maxLines: widget.isObscure ?? false ? 1 : 7,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.formValidator,
        textAlign: widget.textAlign,
        cursorColor: Colors.grey[400],
        controller: widget.controller,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Colors.black45),
        keyboardType: widget.textInputType,
        textInputAction: TextInputAction.next,
        obscureText: widget.isObscure ?? false ? isPasswordShow : false,
        enabled: widget.isEnabled,
        decoration: customInputDecoration(
            trailingIcon: widget.trailingIcon,
            trailing: widget.trailing,
            textLeading: widget.textLeading,
            leadingIcon: widget.icon,
            hint: widget.hint));
  }
}

// ignore: must_be_immutable
class CustomPhoneInput extends StatefulWidget {
  CustomPhoneInput({
    Key? key,
    this.controller,
    required this.onCountryChange,
    this.onValueChange,
    this.formValidator,
    this.autoFocus,
    this.initialCountryCode,
  }) : super(key: key);

  TextEditingController? controller;
  FormFieldValidator? formValidator;
  Function(Country)? onCountryChange;
  Function(String)? onValueChange;
  String? initialCountryCode;
  bool? autoFocus;

  @override
  State<CustomPhoneInput> createState() => _CustomPhoneInputState();
}

class _CustomPhoneInputState extends State<CustomPhoneInput> {
  @override
  Widget build(BuildContext context) {
    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: InternationalPhoneNumberInput(
    //     autoValidateMode: AutovalidateMode.onUserInteraction,
    //     locale: Get.locale.toString() == 'en_US' ? 'en' : 'ar',
    //     // maxLength: 9,
    //     countries: const [
    //       "AE",
    //       "QA",
    //       "OM",
    //       "KW",
    //       "BH",
    //       "SA",
    //       // "PK", don't show i confirmed from client
    //     ],
    //     hintText: "SEARCH_COUNTRY".tr,
    //     errorMessage: "INVALID_MOBILE_NUMBER".tr,
    //     keyboardType: TextInputType.phone,
    //     // initialValue: PhoneNumber(isoCode: countryISO),
    //     selectorConfig: const SelectorConfig(
    //       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
    //     ),
    //     onInputChanged: (value) {
    //       // print(value.isoCode);
    //       // countryISO = value.isoCode ?? "SA";
    //     },
    //   ),
    // );

    //? ============== SECOND ==============
    return PhoneNumberInput(
      initialCountry: 'SA',
      includedCountries: const ["SA"],
      showSelectedFlag: false,
      allowSearch: false,
      allowPickFromContacts: false,
      controller: PhoneNumberInputController(context),
      locale: 'ar',
      searchHint: "SEARCH_COUNTRY_CODE".tr,
      errorText: "INVALID_MOBILE_NUMBER".tr,
      hint: "5xxxxxxxxx".tr,
      onChanged: widget.onValueChange,
      border: outlineInputBorder(),
      enabledBorder: outlineInputBorder(),
      focusedBorder: outlineInputBorder(),
    );

    //? ============== FIRST ==============
    // return Directionality(
    //   textDirection: TextDirection.ltr,
    //   child: IntlPhoneField(
    //     validator: (value) {
    //       return null;
    //     },
    //     autovalidateMode: AutovalidateMode.onUserInteraction,
    //     invalidNumberMessage: "INVALID_MOBILE_NUMBER".tr,
    //     onCountryChanged: widget.onCountryChange,
    //     autofocus: widget.autoFocus ?? false,
    //     controller: widget.controller,
    //     flagsButtonPadding: const EdgeInsets.only(left: 5),
    //     dropdownIconPosition: IconPosition.trailing,
    //     cursorColor: AppColors.greyBackground,
    //     keyboardType: TextInputType.phone,
    //     initialValue: "",
    //     dropdownIcon: const Icon(
    //       EvaIcons.arrowIosDownwardOutline,
    //       color: AppColors.black50,
    //       size: 18,
    //     ),
    //     textAlign: TextAlign.left,
    //     pickerDialogStyle: PickerDialogStyle(
    //       searchFieldInputDecoration: customInputDecoration(
    //         hint: "SEARCH_COUNTRY".tr,
    //       ),
    //       countryCodeStyle: const TextStyle(),
    //     ),
    //     initialCountryCode: widget.initialCountryCode ?? initialCountry,
    //     decoration: customInputDecoration(
    //       hint: "ENTER_YOUR_PHONE_NUMBER".tr,
    //     ),
    //   ),
    // );
  }
}

// ignore: must_be_immutable
class CustomVerificationInput extends StatelessWidget {
  CustomVerificationInput({
    Key? key,
    required this.onSubmitted,
    this.onChange,
    this.textEditingController,
  }) : super(key: key);

  Function(String) onSubmitted;
  Function(String)? onChange;
  TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        animationType: AnimationType.slide,
        cursorHeight: 10,
        // errorAnimationController: errorController,
        controller: textEditingController,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: LightThemeColors.primaryColor,
          selectedColor: LightThemeColors.hintTextColor,
          inactiveColor: LightThemeColors.hintTextColor.withOpacity(0.2),
          fieldHeight: 60.h,
          fieldWidth: 50.w,
          borderRadius: BorderRadius.circular(12),
          activeFillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        autoFocus: true,
        onSubmitted: onSubmitted,
        onCompleted: onSubmitted,
        beforeTextPaste: (text) {
          return true;
        },
        onChanged: onChange ?? (String value) {},
      ),
    );
  }
}

// ignore: must_be_immutable
// class CustomLocationInput extends StatelessWidget {
//   CustomLocationInput({
//     Key? key,
//     required this.controller,
//     this.latLngDetailFunction,
//     this.itemClickFunction,
//     this.onTrailingIconClick,
//   }) : super(key: key);

//   TextEditingController controller;
//   Function(Prediction)? latLngDetailFunction;
//   Function(Prediction)? itemClickFunction;
//   Function()? onTrailingIconClick;

//   @override
//   Widget build(BuildContext context) {
//     return GooglePlaceAutoCompleteTextField(
//       textEditingController: controller,
//       googleAPIKey: API_KEY,
//       inputDecoration: customInputDecoration(
//         hint: "Enter the location",
//         trailingIcon: Icons.location_on_outlined,
//         onTrailingIconClick: onTrailingIconClick,
//       ),
//       debounceTime: 400,
//       countries: const ["PS", "SA"],
//       isLatLngRequired: true,
//       getPlaceDetailWithLatLng: latLngDetailFunction,
//       itemClick: itemClickFunction,
//     );
//   }
// }

// ===================================

InputDecoration customInputDecoration({
  String? leadingIcon,
  bool? trailingIcon,
  String? textLeading,
  Widget? trailing,
  String? hint,
  Function()? onTrailingIconClick,
}) {
  return InputDecoration(
    fillColor: LightThemeColors.white,
    contentPadding: EdgeInsets.only(right: 12.w),
    filled: true,
    prefixIcon: leadingIcon == null
        ? null
        : SizedBox(
            width: textLeading == "" ? 70.w : 80.w,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                        color: LightThemeColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(kBorderRadius),
                            topRight: Radius.circular(kBorderRadius))),
                    child: Padding(
                      padding: const EdgeInsets.all(kPadding / 1.6),
                      child: CustomSvg(
                        leadingIcon,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    suffixIcon: trailingIcon == false
        ? textLeading == ""
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  " $textLeading",
                  textAlign: TextAlign.center,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black45),
                ),
              )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(AppString.myChoice,
                textAlign: TextAlign.center,
                style: Theme.of(Get.context!)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: LightThemeColors.primaryColor)),
          ),
    hintText: "  $hint",
    border: outlineInputBorder(),
    disabledBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(color: LightThemeColors.borderTextColor),
  );
}
