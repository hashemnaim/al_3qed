import 'package:al_3qed/Module/create_contract/model/step_model.dart';
import 'package:al_3qed/Module/create_contract/view/widget/widget_upload_image.dart';
import 'package:al_3qed/Module/payment_contract/controller/payment_controller.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/helper/image_helper.dart';
import 'package:al_3qed/core/helper/loading.dart';
import 'package:al_3qed/core/helper/valdtion_helper.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/core/utils/toast.dart';
import 'package:al_3qed/widgets/custom_divider.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/constants/images_path.dart';

class PaymentContractScreen extends GetView<PaymentController> {
  PaymentContractScreen({super.key});
  List<String> title = [
    AppString.applicationFees,
    AppString.governmentRent,
    AppString.valueAddedTax,
  ];
  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();

    Get.put(PaymentController());
    return Scaffold(
      backgroundColor: LightThemeColors.accentColor,
      appBar: AppBar(
        leadingWidth: 40,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(ImagePaths.back),
            )),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       Get.toNamed(AppRoutes.settingScreen);
        //     },
        //     child: const Padding(
        //       padding: EdgeInsets.all(9.0),
        //       child: CustomSvg(ImagePaths.menu),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.financialStatements,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SpaceH20(),
                      // ListView.separated(
                      //   primary: false,
                      //   shrinkWrap: true,
                      //   itemBuilder: (BuildContext context, int index) =>
                      //       listTileText(
                      //           context,
                      //           settingController.contractPeriodsModel.value
                      //                   .data![index].note ??
                      //               ""),
                      //   separatorBuilder: (context, index) => const SpaceH20(),
                      //   itemCount: settingController
                      //       .contractPeriodsModel.value.data!.length,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomDivider(
                            color: const Color(0xff000000).withOpacity(0.3)),
                      ),
                      // const SpaceH10(),
                      // listTileText(context, AppString.totalContrat),
                      // const SpaceH10(),
                    ],
                  ),
                ),
              ),
              // const SpaceH16(),
              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: CustomInput(
              //       hint: AppString.typeBankAccount,
              //       controller: controller.typeBankAccount,
              //       formValidator: (value) =>
              //           ValidationHelper.validationHelper.validateNull(value),
              //       textInputType: TextInputType.text),
              // ),
              const SpaceH16(),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SpaceH4(),
                      Text(
                        AppString.accountOwner,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SpaceH16(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.nameOwner,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: LightThemeColors.hintTextColor),
                          ),
                          Text(
                            settingController
                                .bankModel.value.data![0].bankAccountName!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SpaceH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.bnak,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: LightThemeColors.hintTextColor),
                          ),
                          Text(
                            settingController
                                .bankModel.value.data![0].bankName!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SpaceH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.iBAN,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: LightThemeColors.hintTextColor),
                          ),
                          Text(
                            settingController
                                .bankModel.value.data![0].bankAccountNumber!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() => WidgetUploadImage(
                    title: "",
                    buttonText: AppString.imageReceipt,
                    notImage:
                        controller.imageFatoora.value == "" ? true : false,
                    onTap: () async {
                      String? file = await ImageHelper.helper.pickImage() ?? "";
                      controller.imageFatoora.value = file;
                    },
                  )),
              const SpaceH4(),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CustomInput(
                    hint: AppString.nameAccountTransfe,
                    controller: controller.nameAccountTransfeController,
                    formValidator: (value) =>
                        ValidationHelper.validationHelper.validateNull(value),
                    textInputType: TextInputType.text),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          height: 52.h,
                          width: 300.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: LightThemeColors.primaryColor,
                            ),
                            onPressed: () async {
                              if (controller.imageFatoora.value == "") {
                                showSnackBar(
                                  message: "يجب رفع الصورة المطلوبة",
                                  type: ToastType.DANGER,
                                );
                              } else {
                                showOrHideLoading(false, "GETTING_INFO".tr);

                                StepModel step6 = await controller.setStep6();
                                showOrHideLoading(true, "GETTING_INFO".tr);

                                if (step6.success == false) {
                                  showSnackBar(
                                    message: step6.message!,
                                    type: ToastType.DANGER,
                                  );
                                } else {
                                  Get.offNamed(AppRoutes.myContractScreen);
                                }
                              }
                            },
                            child: Text(
                              AppString.paymentAfterSending,
                              // AppString.receiptAttached.tr,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 52.h,
                        //   width: 166.w,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       if (controller.formKey.currentState!.validate()) {
                        //         alertDialog(context);
                        //       }
                        //     },

                        //     child: Text(
                        //       AppString.paymentAfterSending,
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // )
                      ])),
              const SpaceH10(),
            ],
          ),
        ),
      ),
    );
  }

  Row listTileText(BuildContext context, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: LightThemeColors.hintTextColor),
        ),
        Text(
          "125 ${AppString.currency}",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
