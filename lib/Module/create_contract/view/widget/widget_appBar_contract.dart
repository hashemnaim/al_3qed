import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/images_path.dart';

class WidgetAppBarContract extends StatelessWidget {
  const WidgetAppBarContract({
    super.key,
    required this.createContractController,
  });

  final CreateContractController createContractController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      leading: InkWell(
          onTap: () {
            createContractController.indexPage == 1
                ? Get.back()
                : createContractController.previousPage();
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
    );
  }
}
