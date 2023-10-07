import 'dart:developer';

import 'package:al_3qed/Module/auth/socialMedia.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ndialog/ndialog.dart';

import '../../model/login_model.dart';
import '../../service/auth_service.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onLoginClick(context) async {
    if (formKey.currentState!.validate()) {
      var data = {
        "email": emailController.value.text,
        "password": passwordController.value.text
      };
      log(data.toString());
      showOrHideLoading(false, "GETTING_INFO".tr);

      LoginModel response = await AuthService.login(data);

      log(response.toJson().toString());
      showOrHideLoading(true, "GETTING_INFO".tr);
      if (response.success == true) {
        await SPHelper.sHelper.setToken(response.data!.token!);
        await SPHelper.sHelper.saveUserData(response.data!.user!.toJson());
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        showOrHideLoading(true, "GETTING_INFO".tr);

        if (response.code == 400) {
          Get.toNamed(AppRoutes.otpScreen, arguments: {
            "email": emailController.value.text,
            "password": passwordController.value.text,
            "isRegister": false,
          });
        } else {
          showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
        }
      }
    }
  }

  onLoginGoogleClick(context) async {
    SocialMediaAuth().signInWithGoogle();
    // if (formKey.currentState!.validate()) {
    //   await SPHelper.sHelper.setToken("islogen");
    //   Get.offAllNamed(AppRoutes.homeScreen);

    //   var data = {
    //     "email": emailController.value.text,
    //     "password": passwordController.value.text
    //   };
    //   showOrHideLoading(false, "GETTING_INFO".tr);

    //   LoginModel response = await AuthService.login(data);

    //   showOrHideLoading(true, "GETTING_INFO".tr);
    //   if (response.success == true) {
    //     // Get.toNamed(
    //     //   '/otp',
    //     //   arguments: {
    //     //     "user_id": response.data!.userId.toString(),
    //     //     "mobile": phoneController.value.text,
    //     //     "isRegister": false,
    //     //   },
    //     // );
    //     showToast("Ok".tr, response.message!.tr, ToastType.SUCCESS);
    //   } else {
    //     showOrHideLoading(true, "GETTING_INFO".tr);

    //     if (response.message == 'Your account is inactive!') {
    //       // accountInactiveAlert(context, response.data?.userId ?? 0);
    //     } else {
    //       showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
    //     }
    //   }
    // }
  }

  accountInactiveAlert(context, int userId) async {
    await NDialog(
      title: Text(
        "ACCOUNT_DISABLED".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "YOUR_ACCOUNT_IS_DISABLED_YOU_CAN_ACTIVATE_YOUR_ACCOUNT".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomTextButton(
                text: "BACK".tr,
                color: LightThemeColors.primaryColor,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SpaceW12(),
            Expanded(
              child: CustomTextButton(
                text: "CONTACT".tr,
                color: LightThemeColors.primaryColor,
                onPress: () async {
                  Navigator.pop(context);
                  await Get.toNamed('/contact-us', arguments: {
                    "userId": userId,
                  });
                  // activateAccount();
                },
              ),
            ),
          ],
        ),
      ],
    ).show(context);
  }

  activateAccount() async {
    showOrHideLoading(false, "ACTIVATING_ACCOUNT");
    // var response = await AuthService.activeInactiveUser(data);

    // print(response.message);
    // showOrHideLoading(true, "ACTIVATING_ACCOUNT".tr);
    // if (response.status == 'success') {
    //   showToast("ACCOUNT_ACTIVATED".tr,
    //       "NOW_YOU_CAN_LOGIN_WITH_YOUR_ACCOUNT".tr, ToastType.SUCCESS);
    // } else {
    //   showToast("ERROR".tr, "SOMETHING_WENTS_WRONG_TRY_AGAIN_LATER".tr,
    //       ToastType.DANGER);
    // }
  }

  loginAsGuest() {
    // StorageService.writeIsGuest(true);
    showToast("WELCOME_BACK".tr, "WELCOME_TO_VASA_APP".tr, ToastType.SUCCESS);
    Get.deleteAll();
    Get.offAndToNamed('/');
  }
}
