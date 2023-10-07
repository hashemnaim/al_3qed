import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/Module/auth/register/controller/register_controller.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(RegisterController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40.w,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () => Get.back(),
                child: const CustomSvg(ImagePaths.back)),
          ),
        ),
        body: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: SizedBox(
                        height: Get.height,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomAssetsImage(ImagePaths.undrawSignUp,
                                  height: 147.h, width: 236.w),
                              const SpaceH8(),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(AppString.accountInfo.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!)),
                              const SpaceH20(),
                              CustomInput(
                                controller: controller.userNameController,
                                hint: AppString.username,
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
                                controller: controller.emailController,
                                hint: AppString.email,
                                textInputType: TextInputType.emailAddress,
                                icon: ImagePaths.email,
                                formValidator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "EMAIL_IS_REQUIRED".tr),
                                  EmailValidator(
                                      errorText: "ENTER_VALID_EMAIL".tr),
                                ]),
                              ),
                              const SpaceH20(),
                              CustomInput(
                                controller: controller.mobileController,
                                hint: AppString.mobile,
                                textInputType: TextInputType.phone,
                                icon: ImagePaths.call,
                                formValidator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "MOBILE_IS_REQUIRED".tr),
                                ]),
                              ),
                              const SpaceH20(),
                              CustomInput(
                                controller: controller.passwordController,
                                hint: AppString.password,
                                textInputType: TextInputType.visiblePassword,
                                isObscure: true,
                                icon: ImagePaths.password,
                                formValidator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Password_IS_REQUIRED".tr),
                                  MinLengthValidator(8,
                                      errorText: "ENTER_VALID_PASSWORD".tr),
                                ]),
                              ),
                              const SpaceH20(),
                              CustomInput(
                                controller:
                                    controller.confirmPasswordController,
                                hint: AppString.confirmPassword,
                                textInputType: TextInputType.visiblePassword,
                                isObscure: true,
                                icon: ImagePaths.password,
                                formValidator: (value) => ValidationHelper
                                    .validationHelper
                                    .validateConfrmationPassword(
                                        value,
                                        controller
                                            .passwordController.value.text),
                              ),
                              const SpaceH36(),
                              CustomPrimaryButton(
                                text: AppString.createAcoount.tr,
                                onPressed: () async {
                                  controller.onRegisterClick();
                                },
                              ),
                              const SpaceH16(),
                              Row(
                                children: [
                                  const Expanded(child: Divider()),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(AppString.or.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: const Color(0xff758499)
                                                    .withOpacity(0.5))),
                                  ),
                                  const Expanded(child: Divider()),
                                ],
                              ),
                              const SpaceH16(),
                              GestureDetector(
                                onTap: () async {
                                  controller.onLoginGoogleClick(context);
                                },
                                child: Container(
                                  width: 342,
                                  height: 46.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey[500]!)
                                      ]),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const CustomSvg(ImagePaths.googlelogo),
                                        const SpaceW16(),
                                        Text(AppString.loginByGoogle.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color:
                                                        const Color(0xff000000)
                                                            .withOpacity(0.5)))
                                      ]),
                                ),
                              ),
                              const SpaceH30(),
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
                                          await Get.toNamed(
                                              AppRoutes.rgisterScreen);
                                        },
                                        child: Text(
                                          AppString.login.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: LightThemeColors
                                                    .primaryColor,
                                              ),
                                        )),
                                  ]),
                            ]),
                      ),
                    )))));
  }
}
