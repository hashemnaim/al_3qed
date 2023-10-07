import 'package:al_3qed/Module/auth/socialMedia.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../service/auth_service.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isAgreementChecked = false.obs;

  onRegisterClick() async {
    if (formKey.currentState!.validate()) {
      var data = {
        "fname": userNameController.value.text,
        "lname": userNameController.value.text,
        "email": emailController.value.text,
        "mobile": mobileController.value.text,
        "password": passwordController.value.text
      };
      // showOrHideLoading(false, "GETTING_INFO".tr);
      var response = await AuthService.signup(data);
      showOrHideLoading(true, "GETTING_INFO".tr);
      if (response.success == true) {
        Get.toNamed(
          AppRoutes.otpScreen,
          arguments: {
            "email": emailController.value.text,
            "password": passwordController.value.text,
            "isRegister": false,
          },
        );
        showToast("Ok".tr, response.message!.tr, ToastType.SUCCESS);
      } else {
        showOrHideLoading(true, "GETTING_INFO".tr);

        if (response.message == 'Your account is inactive!') {
          // accountInactiveAlert(context, response.data?.userId ?? 0);
        } else {
          showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
        }
      }
    }
  }

  onLoginGoogleClick(context) async {
    SocialMediaAuth().signInWithGoogle();
    if (formKey.currentState!.validate()) {
      var data = {
        "email": emailController.value.text,
        "password": passwordController.value.text
      };
      showOrHideLoading(false, "GETTING_INFO".tr);

      var response = await AuthService.signup(data);

      showOrHideLoading(true, "GETTING_INFO".tr);
      if (response.success == true) {
        Get.toNamed(
          AppRoutes.otpScreen,
          arguments: {
            "email": emailController.value.text,
            "isRegister": false,
          },
        );
        showToast("Ok".tr, response.message!.tr, ToastType.SUCCESS);
      } else {
        showOrHideLoading(true, "GETTING_INFO".tr);

        if (response.message == 'Your account is inactive!') {
          // accountInactiveAlert(context, response.data?.userId ?? 0);
        } else {
          showToast("ERROR".tr, response.message!.tr, ToastType.DANGER);
        }
      }
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
