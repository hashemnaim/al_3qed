import 'package:al_3qed/config/routes/routes.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_input.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rate/rate.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.offAllNamed(AppRoutes.homeScreen),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomSvg(ImagePaths.back),
            )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SpaceH20(),
        Center(
          child: CustomSvg(
            ImagePaths.review,
            height: 250.h,
          ),
        ),
        const SpaceH20(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppString.ratingMatters,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SpaceH20(),
        Center(
          child: Rate(
            iconSize: 40,
            color: Colors.amber,
            allowHalf: true,
            allowClear: true,
            initialValue: 5,
            readOnly: false,
            onChange: (value) => print(value),
          ),
        ),
        const SpaceH20(),
        CustomInput(
          hint: "",
          textInputType: TextInputType.text,
          minLines: 5,
        ),
        const SpaceH30(),
        Center(
          child: SizedBox(
            height: 52.h,
            width: 343.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(),
              onPressed: () {
                Get.offAllNamed(AppRoutes.homeScreen);
              },
              child: Text(
                AppString.rateNow.tr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SpaceH30(),
      ]),
    );
  }
}
