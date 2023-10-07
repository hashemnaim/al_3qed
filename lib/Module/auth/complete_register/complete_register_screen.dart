import 'package:al_3qed/Module/auth/complete_register/controller/complete_register_controller.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_svg.dart';

class CompleteRegisterScreen extends StatelessWidget {
  const CompleteRegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CompleteRegisterController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: const EdgeInsets.all(kPadding),
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Form(
                    key: controller.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SpaceH80(),
                          CustomAssetsImage(ImagePaths.undrawSignUp,
                              height: 147.h, width: 236.w),
                          const SpaceH8(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(AppString.contactInfo.tr,
                                style:
                                    Theme.of(context).textTheme.titleMedium!),
                          ),
                          const SpaceH36(),
                          CustomInput(
                            controller: controller.firstController,
                            hint: AppString.firstName,
                            textInputType: TextInputType.name,
                            icon: ImagePaths.profile,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                errorText: "USERNAME_IS_REQUIRED".tr,
                              ),
                            ]),
                          ),
                          const SpaceH20(),
                          CustomInput(
                            controller: controller.lastController,
                            hint: AppString.secondName,
                            textInputType: TextInputType.name,
                            icon: ImagePaths.profile,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                errorText: "USERNAME_IS_REQUIRED".tr,
                              ),
                            ]),
                          ),
                          const SpaceH20(),
                          CustomInput(
                            controller: controller.phoneController,
                            hint: AppString.mobile,
                            textInputType: TextInputType.number,
                            icon: ImagePaths.call,
                            formValidator: (value) => ValidationHelper
                                .validationHelper
                                .validateNull(value),
                          ),
                          const SpaceH36(),
                          CustomPrimaryButton(
                            text: AppString.next.tr,
                            onPressed: () async {
                              controller.onRegisterClick();
                            },
                          ),
                          const SpaceH80(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppString.yesAccount.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!),
                                const SpaceW2(),
                                GestureDetector(
                                    onTap: () async {
                                      await Get.toNamed(AppRoutes.loginScreen);
                                    },
                                    child: Text(
                                      AppString.login.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color:
                                                LightThemeColors.primaryColor,
                                          ),
                                    )),
                              ]),
                        ])))));
  }
}
