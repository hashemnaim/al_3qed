import 'package:al_3qed/Module/my_contract/controller/my_contract_controller.dart';
import 'package:al_3qed/Module/notification/notification_screen.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/lunchers_helper.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetalisMyContractScreen extends GetView<MyContractController> {
  const DetalisMyContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyContractController());
    return Scaffold(
      backgroundColor: LightThemeColors.accentColor,
      appBar: AppBar(
        leadingWidth: 40,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(ImagePaths.back),
            )),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const NotificationScreen()),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomSvg(ImagePaths.notification),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.settingScreen);
            },
            child: const Padding(
              padding: EdgeInsets.all(9.0),
              child: CustomSvg(ImagePaths.menu),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SpaceH12(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "عقودي",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.saveFile("", "sample.pdf");
                  ScaffoldMessenger.of(Get.context!).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'success',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(AppString.download),
                      const SizedBox(width: 6),
                      const CustomSvg(
                        ImagePaths.download,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SpaceH16(),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.1),
                      blurRadius: 22,
                      spreadRadius: 0,
                      offset: const Offset(0, 16))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SpaceH8(),
                  Row(
                    children: [
                      const CustomAssetsImage(
                        "pdf",
                        height: 30,
                        width: 30,
                        fit: BoxFit.contain,
                      ),
                      const SpaceW12(),
                      Text(
                        "عقودي",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 52.h,
                      width: 350.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Get.offNamed(
                            AppRoutes.reviewScreen,
                          );
                        },
                        child: Text(
                          AppString.paymentSendReal.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SpaceH16(),
                    SizedBox(
                      height: 52.h,
                      width: 350.w,
                      child: OutlinedButton(
                        // style: ElevatedButton.styleFrom(
                        //     backgroundColor: LightThemeColors.primaryColor),
                        onPressed: () {
                          LuncherHelper.validationHelper.launchWhatsApp(
                              phone: "00972597376136",
                              message: "عقد ايجار: 1225#  ");
                        },
                        child: Text(
                          AppString.communicateModifyDraft,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: LightThemeColors.primaryColor),
                        ),
                      ),
                    )
                  ])),
          const SpaceH20()
        ]),
      ),
    );
  }
}
