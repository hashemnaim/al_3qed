import 'package:al_3qed/Module/setting/view/screen/feq_app_screen.dart';
import 'package:al_3qed/Module/setting/view/screen/privcy_policy_screen.dart';
import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/config/shared_preferences.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../home/view/widget/widget_appBar_home.dart';
import '../widget/widget_card_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 60),
        child: WidgetAppBarHome(
          imageActions: ImagePaths.closecircle,
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SpaceH8(),
        WidgetCardSetting(
          text: AppString.profileScreen,
          image: ImagePaths.basilHome,
          onTap: () => Get.toNamed(AppRoutes.profileScreen),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.createResidentialContract,
          image: ImagePaths.editContract,
          onTap: () => Get.toNamed(AppRoutes.infoContractScreen,
              arguments: {"title": AppString.residentialContract}),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.createCommercialContract,
          image: ImagePaths.editContract,
          onTap: () => Get.toNamed(AppRoutes.infoContractScreen,
              arguments: {"title": AppString.commercialContract}),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.myContract,
          image: ImagePaths.editContract,
          onTap: () => Get.toNamed(AppRoutes.myContractScreen),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.privacy,
          image: ImagePaths.privacy,
          onTap: () => Get.to(() => const PrivcyPolicyScreen()),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.fqa,
          image: ImagePaths.question,
          onTap: () => Get.to(() => const FeqAppScreen()),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.trem,
          image: ImagePaths.policy,
          onTap: () => Get.to(() => const PrivcyPolicyScreen()),
        ),
        const Divider(),
        WidgetCardSetting(
          text: AppString.language,
          image: ImagePaths.language,
        ),
        const Divider(),
        const SpaceH20(),
        CustomPrimaryButton(
          text: AppString.login.tr,
          onPressed: () async {
            SPHelper.sHelper.clear();
            Get.offAllNamed(AppRoutes.loginScreen);
          },
        ),
        const SpaceH30(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.w),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              CustomSvg(ImagePaths.whatsapp),
              CustomSvg(ImagePaths.instagram),
              CustomSvg(ImagePaths.snapchat),
              CustomSvg(ImagePaths.twitter),
            ],
          ),
        ),
        const SpaceH20(),
        Text(
          AppString.copyWrite,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: const Color(0xff5F5F5F)),
        ),
      ]),
    );
  }
}
