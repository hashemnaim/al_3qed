import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/Module/setting/view/widget/widget_feq.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeqAppScreen extends GetView<SettingController> {
  const FeqAppScreen({Key? key}) : super(key: key);

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
        title: const Text("الاسئلة الشائعة"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Obx(() => controller.feqModel.value.items!.isEmpty
        //     ? Center(
        //         child: Text(
        //         "There are no questions".tr,
        //         style: Theme.of(context).textTheme.labelLarge,
        //       ))
        //     :
        Expanded(child: WidgetFeq())
        // ),
      ]),
      // bottomNavigationBar: const BottomNavBar(isHome: false),
    );
  }
}
