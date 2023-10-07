import 'package:al_3qed/Module/setting/controller/profile_controller.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/helper/image_helper.dart';
import 'package:al_3qed/core/helper/keyboard.dart';
import 'package:al_3qed/widgets/custom_button.dart';

import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_network_image.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:al_3qed/widgets/method_helpar.dart';
import 'package:al_3qed/widgets/widget_status.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSvg(ImagePaths.back),
              )),
          title: const Text("الصفحة الشخصية"),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Obx(
              () => WidgetStatus(
                apiCallStatus: controller.profileStatus.value,
                loadingWidget: () => loadingWidget4(),
                successWidget: () => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () async {
                            controller.userModel.value.photo =
                                ImageHelper.helper.pickImage().toString();
                            // final croppedFile = await ImageHelper.helper
                            // .imageCropper(
                            //     file: photo!,
                            //     cropStyle: CropStyle.circle);
                            // if (croppedFile != null) {
                            //   await controller.uploadeImage(croppedFile.path);
                            // }

                            // await controller.getUpdateProfile();

                            // controller.images = croppedFile.path;
                          },
                          child: controller.userModel.value.photo == ""
                              ? const CustomSvg(
                                  "home/avatar_add",
                                  height: 100,
                                  width: 100,
                                )
                              : CustomNetworkImage(
                                  imagePath:
                                      controller.userModel.value.photo ?? "",
                                  height: 100,
                                  width: 100,
                                  borderRadius: 0),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text("full name".tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                      SizedBox(height: 16.h),
                      CustomInput(
                        hint: "ENTER_YOUR_NAME".tr,
                        textInputType: TextInputType.text,
                        onChange: (value) {
                          controller.userModel.value.fname = value;
                        },
                        controller:
                            TextEditingController.fromValue(TextEditingValue(
                          text: controller.userModel.value.fname!,
                        )),
                        formValidator: MultiValidator([
                          RequiredValidator(
                            errorText: "USERNAME_IS_REQUIRED".tr,
                          ),
                        ]),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "EMAIL".tr,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 16.h),
                      CustomInput(
                        hint: "ENTER_YOUR_EMAIL".tr,
                        textInputType: TextInputType.emailAddress,
                        onChange: (value) {
                          controller.userModel.value.email = value;
                        },
                        controller:
                            TextEditingController.fromValue(TextEditingValue(
                          text: controller.userModel.value.email ?? "",
                        )),
                        formValidator: MultiValidator([
                          RequiredValidator(errorText: "EMAIL_IS_REQUIRED".tr),
                          EmailValidator(errorText: "ENTER_VALID_EMAIL".tr),
                        ]),
                      ),
                      SizedBox(height: 16.h),
                      Text("MOBILE_NUMBER".tr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500)),
                      SizedBox(height: 16.h),
                      CustomInput(
                        hint: "MOBILE_NUMBER".tr,
                        textInputType: TextInputType.phone,
                        onChange: (value) {
                          controller.userModel.value.mobile = value;
                        },
                        controller:
                            TextEditingController.fromValue(TextEditingValue(
                          text: controller.userModel.value.mobile ?? "",
                        )),
                        formValidator: MultiValidator([
                          RequiredValidator(errorText: "MOBILE_NUMBER".tr),
                        ]),
                      ),
                      SizedBox(height: 30.h),
                      TextButton(
                          child: Text("delete account".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400)),
                          onPressed: () async {
                            return showDialog(
                              context: Get.context!,
                              builder: (BuildContext context) => AlertDialog(
                                scrollable: true,
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                content: Container(
                                  width: 336.w,
                                  padding: const EdgeInsets.all(4),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 19.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(height: 20.h),
                                        Text(
                                          "DO_YOU_REALLY_WANT_TO_DELETE_THIS_ACCOUNT"
                                              .tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(
                                                  color: LightThemeColors
                                                      .bodyMediumColor,
                                                  fontSize: 18.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                        SizedBox(height: 20.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                await controller.signOut();
                                                Get.offAllNamed(
                                                    AppRoutes.loginScreen);
                                              },
                                              child: Container(
                                                width: 102.w,
                                                height: 45.h,
                                                decoration: BoxDecoration(
                                                    color: LightThemeColors
                                                        .hintTextColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Center(
                                                  child: Text(
                                                    "YES".tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                            fontSize: 16.sp,
                                                            color: LightThemeColors
                                                                .hintTextColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                Get.back();
                                              },
                                              child: Container(
                                                width: 102.w,
                                                height: 45.h,
                                                decoration: BoxDecoration(
                                                    color: LightThemeColors
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Center(
                                                  child: Text(
                                                    "NO".tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                            fontSize: 16.sp,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 27.h),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: CustomPrimaryButton(
                          text: "SAVE_CHANGES".tr,
                          onPressed: () async {
                            KeyboardUtil.hideKeyboard(Get.context!);
                            await controller.updateProfile();
                            BotToast.showText(text: "تم حفظ بنجاح");
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
