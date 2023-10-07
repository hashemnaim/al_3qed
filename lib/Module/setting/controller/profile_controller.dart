import 'dart:developer';
import 'dart:io';
import 'package:al_3qed/Module/auth/model/user_model.dart';
import 'package:al_3qed/Module/setting/service/profile_service.dart';
import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/core/helper/image_helper.dart';
import 'package:al_3qed/services/api_call_status.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<TextEditingController>? oldPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController>? newPasswordController =
      TextEditingController().obs;
  Rx<TextEditingController>? confirmPasswordController =
      TextEditingController().obs;
  final selectedIndex = 0.obs;
  RxBool isObscure = true.obs;
  RxBool isObscureNew = true.obs;
  RxString photo = "".obs;
  Rx<UserModel> userModel = UserModel().obs;
  final Rx<TextEditingController> titleMassegeMangerController =
      TextEditingController().obs;
  final Rx<TextEditingController> massegeMangerController =
      TextEditingController().obs;
  Rx<ApiCallStatus> profileStatus = ApiCallStatus.holding.obs;

  getProfile() async {
    profileStatus.value = ApiCallStatus.loading;
    userModel.value = await ProfileService.getProfile();
    log("profileModel ================> ${userModel.toJson().toString()}");
    profileStatus.value = ApiCallStatus.success;
  }

  // addPhotos() async {
  //   final photo = await UplodeImageHelper().pickImage();
  //   if (photo!.path != "error") {
  //     images.value = photo.path;
  //     await uploadeImage(images.value);
  //   }
  // }

  // uploadeImage(String image) async {
  //   BotToast.showLoading();
  //   dio.MultipartFile? images =
  //       await UplodeImageHelper().compressFile(File(image));
  //   final formData = dio.FormData.fromMap({"image": images, "type": "profile"});
  //   await BaseClient.baseClient.post(Constants.uploadFileUrl, data: formData,
  //       onSuccess: (response) async {
  //     if (response.data['status'] == true) {
  //       BotToast.closeAllLoading();
  //       return BaseClient.baseClient.post(Constants.updateProfileUrl,
  //           data: {"image": response.data['items']['path']},
  //           onSuccess: (response) async {
  //         if (response.data['status'] == true) {
  //           await getProfile();
  //           BotToast.closeAllLoading();
  //         } else {
  //           BotToast.showText(
  //               text: response.data['message'], contentColor: Colors.red);
  //           BotToast.closeAllLoading();
  //         }
  //       });
  //     }
  //   });
  // }

  updateProfile() async {
    BotToast.showLoading();
    dio.MultipartFile? images =
        await ImageHelper.helper.compressFile(File(userModel.value.photo!));
    dio.FormData formData = dio.FormData.fromMap({
      "fname": userModel.value.fname ?? "",
      "mobile": userModel.value.mobile ?? "",
      "email": userModel.value.email ?? "",
      "photo": images ?? ""
    });
    await ProfileService.updateProfile(formData);
  }

  signOut() async {
    BotToast.showLoading();
    await ProfileService.logout();
    BotToast.closeAllLoading();
  }

  @override
  void dispose() {
    newPasswordController!.value.dispose();
    oldPasswordController!.value.dispose();
    confirmPasswordController!.value.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    log(SPHelper.sHelper.getToken().toString());
    SPHelper.sHelper.getToken() != "" ? await getProfile() : null;

    super.onInit();
  }
}
