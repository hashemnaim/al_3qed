import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_constants.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/Module/auth/login/controller/login_controller.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Form(
                    key: loginController.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SpaceH80(),
                          CustomAssetsImage(ImagePaths.logo,
                              height: 96.h, width: 69.w),
                          const SpaceH16(),
                          Text(AppString.welcame.tr,
                              style: Theme.of(context).textTheme.titleLarge!),
                          const SpaceH8(),
                          Text(AppString.pleaseLogin.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: LightThemeColors.titleTextColor
                                          .withOpacity(0.4))),
                          const SpaceH36(),
                          CustomInput(
                            controller: loginController.emailController,
                            hint: AppString.email,
                            textInputType: TextInputType.emailAddress,
                            icon: ImagePaths.profile,
                            formValidator: MultiValidator([
                              RequiredValidator(
                                  errorText: "EMAIL_IS_REQUIRED".tr)
                            ]),
                          ),
                          const SpaceH20(),
                          CustomInput(
                            controller: loginController.passwordController,
                            hint: AppString.password,
                            textInputType: TextInputType.visiblePassword,
                            isObscure: true,
                            icon: ImagePaths.password,
                          ),
                          const SpaceH16(),
                          GestureDetector(
                            onTap: () =>
                                Get.toNamed(AppRoutes.forgetPasswordScreen),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(AppString.forgetPassword.tr,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                          const SpaceH36(),
                          CustomPrimaryButton(
                            text: AppString.login.tr,
                            onPressed: () async {
                              loginController.onLoginClick(context);
                            },
                          ),
                          const SpaceH20(),
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
                          GestureDetector(
                            onTap: () async {
                              loginController.onLoginGoogleClick(context);
                            },
                            child: Container(
                              width: 342,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey[500]!)
                                  ]),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CustomSvg(ImagePaths.googlelogo),
                                    const SpaceW16(),
                                    Text(AppString.loginByGoogle.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                color: const Color(0xff000000)
                                                    .withOpacity(0.5)))
                                  ]),
                            ),
                          ),
                          const SpaceH48(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppString.noAccount.tr,
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
                                      AppString.createNewAccount.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color:
                                                LightThemeColors.primaryColor,
                                          ),
                                    )),
                              ]),
                          // const SpaceH30(),
                        ])))));
  }
}
