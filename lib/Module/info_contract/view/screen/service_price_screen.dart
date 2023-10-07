import 'package:al_3qed/Module/info_contract/view/widget/points_clipper.dart';
import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/clip_shadow.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_button.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicePriceScreen extends StatelessWidget {
  const ServicePriceScreen({super.key});
  // List<Map> list = [
  //   {"title": AppString.governmentEjarNetwork, "price": 125},
  //   {"title": AppString.absherAndSMSDocumentationFees, "price": 125},
  //   {"title": AppString.corporation, "price": 125},
  //   {"title": AppString.taxValue, "price": 125},
  // ];
  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();

    Get.arguments['title'] ?? "";

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(ImagePaths.back),
            )),
        title: Text(AppString.servicesPricing),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppString.priceCreateContract,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SpaceH30(),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 20,
                      offset: const Offset(1, 3),
                      spreadRadius: 8,
                    )
                  ], borderRadius: BorderRadius.circular(20)),
                  child: ClipShadow(
                    clipper: PointsClipper(),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(1, 4),
                      ),
                    ],
                    child: Column(
                      children: [
                        ListView.separated(
                          itemCount: settingController
                              .servicesPricingModel.value.data!.length,
                          primary: false,
                          padding: const EdgeInsets.only(top: 12),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) =>
                              ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: widgetCard(
                                settingController.servicesPricingModel.value
                                    .data![index].name!,
                                settingController.servicesPricingModel.value
                                    .data![index].price!,
                                context),
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SpaceH16(),
                        ),
                        const SpaceH30(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 184.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200]!,
                                    blurRadius: 10,
                                    spreadRadius: 4,
                                    offset: const Offset(1, 3),
                                  )
                                ],
                                color: LightThemeColors.buttonColor,
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppString.total,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    "500",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SpaceH44(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SpaceH80(),
            CustomPrimaryButton(
              text: AppString.done.tr,
              onPressed: () async {
                Get.back();
              },
            ),
            const SpaceH20(),
          ],
        ),
      ),
    );
  }

  Widget widgetCard(String title, String price, BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: const Color(0xff383838)),
      ),
      minVerticalPadding: 10,
      trailing: SizedBox(
        width: 80.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: LightThemeColors.primaryColor),
            ),
            Text(
              AppString.currency,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
      ),
    );
  }
}
