import 'package:al_3qed/config/routes/routes.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CompleteRegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isAgreementChecked = false.obs;

  RxString phoneNumber = ''.obs;

  onRegisterClick() async {
    if (formKey.currentState!.validate()) {
      if (phoneController.text.isNotEmpty) {
        Get.toNamed(AppRoutes.otpScreen);

        // showSnackBar(
        //     message: "PLEASE_ENTER_THE_PHONE_NUMBER".tr,
        //     type: ToastType.WARNING,
        //     position: ToastPosition.top);
        // return;
      }
      // if (!isAgreementChecked.value) {
      //   showSnackBar(
      //     message: "PLEASE_AGREE_THE_TERMS_AND_CONDITION".tr,
      //     type: ToastType.WARNING,
      //     position: ToastPosition.top,
      //   );
      //   return;
      // }

      // var data = {
      //   "email": emailController.text,
      //   "name": firstController.text,
      //   "mobile": phoneController.text,
      // };
      // showOrHideLoading(false, "GETTING_INFO".tr);
      // var response = await AuthService.registerUser(data);

      // if (response.success == true) {
      //   var loginResponse = await AuthService.loginUser({
      //     "mobile": phoneController.text,
      //   });

      //   showOrHideLoading(true, "GETTING_INFO".tr);
      //   if (loginResponse.success == true) {
      //     Get.toNamed(
      //       '/otp',
      //       arguments: {
      //         "userData": response.user,
      //         "mobile": phoneController.text,
      //         "user_id": response.user!.id.toString(),
      //         "isRegister": true,
      //       },
      //     );
      //   } else {
      //     showOrHideLoading(true, "GETTING_INFO".tr);
      //     showToast(
      //       "ERROR".tr,
      //       response.message.tr,
      //       ToastType.DANGER,
      //     );
      //   }
      // } else {
      //   showOrHideLoading(true, "GETTING_INFO".tr);

      //   showToast(
      //     "ERROR".tr,
      //     response.message.tr,
      //     ToastType.DANGER,
      //   );
      // }
    }
  }
}
