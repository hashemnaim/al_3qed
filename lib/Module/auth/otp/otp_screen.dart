import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/Module/auth/otp/controller/otp_controller.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OtpController());

    return Scaffold(
        appBar: AppBar(
          leadingWidth: 45.w,
          title: Text(AppString.recentPassword.tr),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
                onTap: () => Get.back(),
                child: const Center(child: CustomSvg(ImagePaths.back))),
          ),
        ),
        body: SizedBox(
            width: Get.width,
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SpaceH20(),
                      CustomAssetsImage(ImagePaths.mailSent,
                          height: 172.h, width: 259.w),
                      const SpaceH36(),
                      SizedBox(
                        width: 350,
                        child: Center(
                          child: Text(
                              "${AppString.infoOtpPassword} ${controller.email.value}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: LightThemeColors.titleTextColor
                                          .withOpacity(0.4))),
                        ),
                      ),
                      const SpaceH36(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35.w),
                        child: CustomVerificationInput(
                          onChange: (value) {
                            controller.verificationCodeController.value = value;
                          },
                          onSubmitted: (value) {
                            controller.onConfirmClick();
                          },
                        ),
                      ),
                      // const SpaceH120(),
                      // CustomPrimaryButton(
                      //   text: AppString.sendCode.tr,
                      //   onPress: () async {
                      //     // controller.onClick(context);
                      //   },
                      // ),
                      const SpaceH20(),
                    ]))));
  }
}
