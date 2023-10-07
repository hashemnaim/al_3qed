import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<Object?> clarificationDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppString.clarification,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 200.h),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                const SpaceH12(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomSvg("contract/info"),
                    const SpaceW4(),
                    Text("${AppString.clarification} :",
                        style: Theme.of(Get.context!).textTheme.bodyLarge!),
                  ],
                ),
                const SpaceH16(),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'مدة العقد سنة = ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xff0008CE), fontSize: 13.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '(125 تفرض من شبكة الايجار الحكومية ) + رسوم تطبيق ثابتة 125 = 250',
                          style: Theme.of(context).textTheme.bodyMedium!),
                    ],
                  ),
                ),
                const SpaceH16(),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'مدة العقد سنتين = ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xff0008CE), fontSize: 13.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '(250 تفرض من شبكة الايجار الحكومية ) + رسوم تطبيق ثابتة 125 = 350',
                          style: Theme.of(context).textTheme.bodyMedium!),
                    ],
                  ),
                ),
                const SpaceH16(),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'مدة العقد ثلاث سنوات = ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xff0008CE), fontSize: 13.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '(375 تفرض من شبكة الايجار الحكومية ) + رسوم تطبيق ثابتة 125 = 500',
                          style: Theme.of(context).textTheme.bodyMedium!),
                    ],
                  ),
                ),
                const SpaceH16(),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'مدة العقد أربع سنوات = ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color(0xff0008CE), fontSize: 13.sp),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '(500 تفرض من شبكة الايجار الحكومية ) + رسوم تطبيق ثابتة 125 = 625',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 13.sp)),
                    ],
                  ),
                ),
                const SpaceH30(),
                Text(
                    "ملاحظة: لا يفرض التطبيق أي رسوم اضافية حتى لو بلغ مدة العقد 30 سنة",
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.red)),
              ]),
            ),
          ),
        );
      });
}

Future<Object?> termsAndConditionsDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppString.clarification,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 100.h),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: [
                  Text("الشروط والاحكام",
                      style: Theme.of(Get.context!)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: LightThemeColors.primaryColor)),
                  const SpaceH12(),
                  Text(AppTrem.termsAndConditions,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.grey[500])),
                ]),
              ),
            ),
          ),
        );
      });
}
