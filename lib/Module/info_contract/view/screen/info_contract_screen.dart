import 'package:al_3qed/Module/home/controller/home_controller.dart';
import 'package:al_3qed/Module/info_contract/view/screen/service_price_screen.dart';
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

class InfoContractScreen extends StatelessWidget {
  InfoContractScreen({super.key});

  List<String> list = [
    AppString.landlordAndTenant,
    AppString.ipan,
    AppString.instrumentInformation,
    AppString.rentedUnitData,
    AppString.contractValueYear,
  ];
  String title = Get.arguments['title'] ?? "";

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomSvg(ImagePaths.back),
            )),
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppString.completeProcedures,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SpaceH20(),
            ListView.separated(
              itemCount: list.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (BuildContext context, int index) => ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: widgetCard(index, context),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SpaceH16(),
            ),
            const SpaceH20(),
            CustomPrimaryButton(
                text: AppString.writingContract.tr,
                onPressed: () async {
                  // await Get.toNamed(AppRoutes.mainCreateContractScreen,
                  //     arguments: {"title": title});
                  homeController.setContractStart(title);
                }),
            const SpaceH20(),
            Center(
              child: TextButton(
                  onPressed: () {
                    Get.to(() => const ServicePriceScreen(),
                        arguments: {"title": title});
                  },
                  child: Column(
                    children: [
                      Text(
                        AppString.servicesPricing,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: LightThemeColors.primaryColor,
                            ),
                      ),
                      const SpaceH2(),
                      Container(
                          height: 1,
                          width: 98,
                          color: LightThemeColors.primaryColor)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Container widgetCard(int index, BuildContext context) {
    return Container(
      height: 50.h,
      width: 343.w,
      decoration: const BoxDecoration(
          color: Color(0xffEDEDED),
          border: Border(
            right: BorderSide(color: LightThemeColors.primaryColor, width: 4),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Text(
          list[index],
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: const Color(0xff383838)),
        ),
      ),
    );
  }
}
