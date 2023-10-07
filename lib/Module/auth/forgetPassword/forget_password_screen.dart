import 'package:al_3qed/Module/auth/forgetPassword/controller/forget_password_controller.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgetPasswordController());
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
            height: Get.height,
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SpaceH20(),
                          CustomSvg(ImagePaths.forgotPassword,
                              height: 172.h, width: 259.w),
                          const SpaceH36(),
                          CustomInput(
                            controller: controller.emailController,
                            hint: AppString.email,
                            textInputType: TextInputType.emailAddress,
                            icon: ImagePaths.email,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                  errorText: "EMAIL_IS_REQUIRED".tr),
                              EmailValidator(errorText: "ENTER_VALID_EMAIL".tr),
                            ]),
                          ),
                          const SpaceH36(),
                          SizedBox(
                            width: 350,
                            child: Center(
                              child: Text(AppString.infoForgetPassword.tr,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: LightThemeColors.titleTextColor
                                              .withOpacity(0.4))),
                            ),
                          ),
                          const SpaceH120(),
                          CustomPrimaryButton(
                            text: AppString.sendCode.tr,
                            onPressed: () async {
                              controller.onClick(context);
                            },
                          ),
                          const SpaceH20(),
                        ])))));
  }
}
