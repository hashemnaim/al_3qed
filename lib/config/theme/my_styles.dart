import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle: getTextTheme(isLightTheme: isLightTheme)
            .bodyLarge!
            .copyWith(fontSize: MyFonts.appBarTittleSize),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarColor: LightThemeColors.white,
            statusBarIconBrightness: Brightness.dark),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.iconColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.scaffoldBackgroundColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        titleLarge: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.titleLarge,
            fontWeight: FontWeight.w500,
            color: LightThemeColors.titleTextColor),
        titleMedium: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.titleMedium,
            fontWeight: FontWeight.w500,
            color: LightThemeColors.titleTextColor),
        labelLarge: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.labelLarge,
            fontWeight: FontWeight.w500,
            wordSpacing: 0,
            color: LightThemeColors.labelLargeColor),
        labelSmall: MyFonts.labelLargeStyle.copyWith(
            fontSize: MyFonts.labelSmall,
            fontWeight: FontWeight.w500,
            wordSpacing: 0,
            color: LightThemeColors.labelSmallColor),
        bodyLarge: MyFonts.bodyTextStyle.copyWith(
            fontSize: MyFonts.bodyLarge,
            fontWeight: FontWeight.w500,
            color: isLightTheme
                ? LightThemeColors.bodyLargeColor
                : DarkThemeColors.bodyTextColor),
        bodyMedium: MyFonts.bodyTextStyle.copyWith(
            fontSize: MyFonts.bodyMedium,
            fontWeight: FontWeight.w500,
            color: isLightTheme
                ? LightThemeColors.bodyMediumColor
                : DarkThemeColors.bodyTextColor),
        bodySmall: MyFonts.bodyTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: MyFonts.bodySmall,
          color: isLightTheme
              ? LightThemeColors.bodySmallColor
              : DarkThemeColors.captionTextColor,
        ),
      );
  // static ChipThemeData getChipTheme({required bool isLightTheme}) {
  //   return ChipThemeData(
  //     backgroundColor: isLightTheme
  //         ? LightThemeColors.chipBackground
  //         : DarkThemeColors.chipBackground,
  //     brightness: Brightness.light,
  //     labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
  //     secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
  //     selectedColor: Colors.black,
  //     disabledColor: Colors.green,
  //     padding: const EdgeInsets.all(5),
  //     secondarySelectedColor: Colors.purple,
  //   );
  // }

  ///Chips text style
  // static TextStyle getChipTextStyle({required bool isLightTheme}) {
  //   return MyFonts.chipTextStyle.copyWith(
  //     fontSize: MyFonts.chipTextSize,
  //     color: isLightTheme
  //         ? LightThemeColors.chipTextColor
  //         : DarkThemeColors.chipTextColor,
  //   );
  // }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme
                  ? LightThemeColors.buttonTextColor
                  : DarkThemeColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme
                  ? LightThemeColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          //     EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor
                    : DarkThemeColors.buttonColor;
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}
