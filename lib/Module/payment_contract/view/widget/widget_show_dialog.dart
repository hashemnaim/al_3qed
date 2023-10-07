import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<Object?> alertDialog(BuildContext context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: AppString.alert,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 320.h),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceH12(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomSvg(
                          "contract/info",
                          height: 30,
                        ),
                        const SpaceW4(),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text("${AppString.alert} :",
                              style:
                                  Theme.of(Get.context!).textTheme.bodyLarge!),
                        ),
                      ],
                    ),
                    const SpaceH8(),
                    Text("            ${AppString.agreePaySubmitting} ",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey[500])),
                    const SpaceH30(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 35.h,
                          width: 147.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () =>
                                Get.offNamed(AppRoutes.myContractScreen),
                            child: Text(
                              AppString.ok.tr,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SpaceW12(),
                        SizedBox(
                          height: 35.h,
                          width: 147.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () => Get.back(),
                            child: Text(
                              AppString.cancel.tr,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        );
      });
}
