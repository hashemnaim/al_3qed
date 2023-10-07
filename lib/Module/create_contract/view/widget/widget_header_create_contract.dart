import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../controller/create_contract_controller.dart';

class WidgetHeaderCreateContract extends StatelessWidget {
  const WidgetHeaderCreateContract({
    super.key,
    required this.titleList,
    required this.controller,
  });

  final List<String> titleList;
  final CreateContractController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleList[controller.indexPage - 1],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            "ِ${AppString.steps} ${controller.indexPage} / ${titleList.length} ",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: LightThemeColors.hintTextColor),
          ),
          const SpaceH16(),
          LinearPercentIndicator(
            width: Get.width - 42.w,
            lineHeight: 4.h,
            padding: EdgeInsets.zero,
            percent: controller.indexPage / titleList.length,
            isRTL: true,
            alignment: MainAxisAlignment.start,
            barRadius: const Radius.circular(12),
            backgroundColor: const Color.fromRGBO(158, 158, 158, 1),
            progressColor: LightThemeColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
