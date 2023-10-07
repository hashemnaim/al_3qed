import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../config/theme/light_theme_colors.dart';

// ignore: must_be_immutable
class PrivcyPolicyScreen extends GetView<SettingController> {
  // const PrivcyPolicyScreen({Key? key}) : super(key: key);

  const PrivcyPolicyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomSvg(ImagePaths.back),
              )),
          title: const Text("الشروط والاحكام"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الشروط والاحكام",
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: LightThemeColors.primaryColor)),
                    const SpaceH12(),
                    Text(AppTrem.termsAndConditions,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.grey[500])),
                  ]),
            ),
          ),
        ));
  }
}
