import 'package:al_3qed/Module/create_contract/controller/create_contract_controller.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_agent_for_owner.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_agent_for_tenant.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_owner_data.dart';
import 'package:al_3qed/Module/create_contract/view/page2/widget/widget_tenant_data.dart';
import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnwerDataPage2 extends StatelessWidget {
  const OnwerDataPage2({super.key});
  @override
  Widget build(BuildContext context) {
    Get.arguments['title'] ?? "";
    return SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        child: Container(
            decoration:
                BoxDecoration(color: const Color(0xffF2F2F2).withOpacity(0.5)),
            child: GetBuilder<CreateContractController>(builder: (controller) {
              return Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Form(
                      key: controller.onwerDataformKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetOwnerData(controller: controller),
                            Visibility(
                                visible: controller.isOwnerDeceased ==
                                        AppString.yes ||
                                    (controller.isOwnerDeceased !=
                                            AppString.yes &&
                                        controller
                                                .addLegalRepresentativeForOwner ==
                                            AppString.yes),
                                child: WidgetAgentOnwerData(
                                    controller: controller)),
                            Divider(color: Colors.grey[300], height: 20.h),
                            WidgetTenantData(controller: controller),
                            const SpaceH10(),
                            Visibility(
                                visible: controller
                                        .addLegalRepresentativeForTenant ==
                                    AppString.yes,
                                child: WidgetAgentTenantData(
                                    controller: controller))
                          ])));
            })));
  }
}
