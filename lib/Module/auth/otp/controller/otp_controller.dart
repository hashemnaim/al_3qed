import 'dart:developer';
import 'package:al_3qed/Module/auth/model/login_model.dart';
import 'package:al_3qed/Module/auth/service/auth_service.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  RxString verificationCodeController = ''.obs;
  RxString verificationCode = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxBool isRegister = false.obs;
  RxString userId = ''.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.value = Get.arguments["email"];
      isRegister.value = Get.arguments["isRegister"];
      password.value = Get.arguments["password"];
    }
    super.onInit();
  }

  onConfirmClick() async {
    Map<String, dynamic> data = {
      "email": email.value,
      "verification_code": verificationCodeController.value,
    };
    log(data.toString());
    showOrHideLoading(false, "VERIFYING".tr);
    var response = await AuthService.verifyOtp(data);

    if (response == true) {
      showOrHideLoading(true, "VERIFYING".tr);

      Map<String, dynamic> data = {
        "email": email.value,
        "password": password.value,
        "fcm_token": "fcmToken",
      };

      showOrHideLoading(false, "GETTING_INFO".tr);

      LoginModel response = await AuthService.login(data);
      showOrHideLoading(true, "GETTING_INFO".tr);
      if (response.success == true) {
        await SPHelper.sHelper.setToken(response.data!.token!);
        await SPHelper.sHelper.saveUserData(response.data!.user!.toJson());
        Get.offAllNamed(AppRoutes.homeScreen);
      } else {
        showOrHideLoading(true, "GETTING_INFO".tr);
        if (response.message == 'Your account is inactive!') {
        } else {
          showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
        }
      }
    }
  }
}
