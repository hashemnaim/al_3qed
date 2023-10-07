import 'package:al_3qed/Module/home/controller/home_controller.dart';
import 'package:al_3qed/Module/my_contract/view/screen/details_my_contract.dart';
import 'package:al_3qed/Module/notification/notification_screen.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyContractScreen extends GetView<SettingController> {
  const MyContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: LightThemeColors.accentColor,
      appBar: AppBar(
        leadingWidth: 40,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(ImagePaths.back),
            )),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const NotificationScreen()),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomSvg(ImagePaths.notification),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.settingScreen);
            },
            child: const Padding(
              padding: EdgeInsets.all(9.0),
              child: CustomSvg(ImagePaths.menu),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SpaceH12(),
          Text(
            "عقودي",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SpaceH4(),
          Expanded(
            child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(top: 12),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () =>
                          Get.to(() => const DetalisMyContractScreen()),
                      child: Container(
                        decoration: BoxDecoration(
                            color: settingController.myContractModel.value.data!
                                        .data![index].isCompleted ==
                                    true
                                ? const Color.fromRGBO(200, 230, 201, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color(0xff000000).withOpacity(0.1),
                                  blurRadius: 22,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 16))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SpaceH8(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "عقد ايجار : ${settingController.myContractModel.value.data!.data![index].uuid} #",
                                    style:
                                        Theme.of(context).textTheme.bodySmall!,
                                  ),
                                  Text(
                                    settingController.myContractModel.value
                                        .data!.data![index].createdAt
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              const SpaceH10(),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text("المالك:  ${  settingController.myContractModel.value
                              //           .data!.data![index].}",
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodySmall!),
                              //   ],
                              // ),
                              // const SpaceH10(),
                              settingController.myContractModel.value.data!
                                          .data![index].isCompleted ==
                                      true
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "المستأجر :  أكرم عبد الواحد",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!,
                                        ),
                                        Text(
                                          "${settingController.myContractModel.value.data!.data![index].totalPrice} ر.س",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 60),
                                      child: CustomPrimaryButton(
                                        text: "إكمال العقد",
                                        onPressed: () async {
                                          // CreateContractController
                                          //     createContractController =
                                          //     Get.put(
                                          //         CreateContractController());

                                          await settingController
                                              .initCreateContract("housing");
                                          await homeController
                                              .setCompletContractStart(
                                                  "housing",
                                                  settingController
                                                      .myContractModel
                                                      .value
                                                      .data!
                                                      .data![index]
                                                      .contractType!,
                                                  settingController
                                                      .myContractModel
                                                      .value
                                                      .data!
                                                      .data![index]
                                                      .id!,
                                                  settingController
                                                      .myContractModel
                                                      .value
                                                      .data!
                                                      .data![index]
                                                      .step!);

                                          // Get.to(() =>
                                          //     const MainCreateContractScreen());
                                        },
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SpaceH12(),
                itemCount:
                    settingController.myContractModel.value.data!.data!.length),
          )
        ]),
      ),
    );
  }
}
