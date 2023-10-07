import 'package:al_3qed/Module/home/controller/home_controller.dart';
import 'package:al_3qed/Module/home/view/widget/widget_appBar_home.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum ContractType { housing, commercial }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    SettingController settingController = Get.find();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: WidgetAppBarHome(
          imageActions: ImagePaths.menu,
          onTap: () {
            Get.toNamed(AppRoutes.settingScreen);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceH48(),
          Center(
            child: CustomSvg(ImagePaths.homePana, height: 163.h, width: 245.w),
          ),
          const SpaceH20(),
          Text(AppString.electroniContract,
              style: Theme.of(context).textTheme.bodyLarge),
          const SpaceH20(),
          SizedBox(
              width: 300,
              child: Text(AppString.infoContract,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: const Color(0xff7B7B7B)))),
          SizedBox(
              width: 300,
              child: Text(AppString.soudiaArabia,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium)),
          const SpaceH20(),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widgetSelectContract(
                    context: context,
                    onTap: () {
                      controller.isSelect.value = 0;
                      controller.contractType.value = ContractType.housing;
                    },
                    isSelect:
                        controller.contractType.value == ContractType.housing,
                    text: AppString.residentialContract,
                    image: ImagePaths.apartment,
                  ),
                  const SpaceW20(),
                  widgetSelectContract(
                      context: context,
                      onTap: () {
                        controller.isSelect.value = 1;
                        controller.contractType.value = ContractType.commercial;
                      },
                      isSelect: controller.contractType.value ==
                          ContractType.commercial,
                      text: AppString.commercialContract,
                      image: ImagePaths.comingHome),
                ],
              )),
          const SpaceH48(),
          CustomPrimaryButton(
            text: AppString.next.tr,
            onPressed: () async {
              settingController.initCreateContract(
                  controller.isSelect.value == 0 ? "housing" : "commercial");
              Get.toNamed(AppRoutes.infoContractScreen, arguments: {
                "title": controller.isSelect.value == 0
                    ? AppString.residentialContract
                    : AppString.commercialContract
              });
            },
          ),
        ],
      ),
    );
  }

  Widget widgetSelectContract(
      {required BuildContext context,
      required VoidCallback onTap,
      required bool isSelect,
      required String text,
      required String image}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 148.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelect == true
                    ? LightThemeColors.primaryColor
                    : LightThemeColors.borderTextColor),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSvg(
                  image,
                  height: 96.h,
                  width: 122.w,
                ),
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SpaceH8(),
          ],
        ),
      ),
    );
  }
}
