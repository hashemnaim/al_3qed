import 'package:al_3qed/config/theme/light_theme_colors.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/create_contract_controller.dart';

class WidgetNextAndPrevious extends StatelessWidget {
  const WidgetNextAndPrevious({
    super.key,
    required this.titleList,
    required this.controller,
  });

  final List<String> titleList;
  final CreateContractController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color(0xffF2F2F2).withOpacity(0.5)),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                controller.indexPage == 1
                    ? Container()
                    : ElevatedButton(
                        onPressed: () => controller.previousPage(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LightThemeColors.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_circle_right_outlined),
                              const SizedBox(width: 4),
                              Text(
                                AppString.previousPage,
                              ),
                            ],
                          ),
                        )),
                titleList.length == controller.indexPage
                    ? ElevatedButton(
                        onPressed: () =>
                            controller.isNextPage(controller.indexPage - 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(AppString.sendContract.tr),
                            ],
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () =>
                            controller.isNextPage(controller.indexPage - 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(AppString.nextPage),
                              const SizedBox(width: 6),
                              const Icon(Icons.arrow_circle_left_outlined),
                            ],
                          ),
                        ),
                      )
              ])),
    );
  }
}
