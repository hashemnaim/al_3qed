import 'package:al_3qed/Module/setting/controller/setting_controller.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WidgetFeq extends StatelessWidget {
  const WidgetFeq({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());

    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: 4,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (contex, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ExpansionTile(
                title: Text("ما المقصود بـ (نسخة إلكترونية)؟",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge!),
                onExpansionChanged: (value) {
                  controller.isExpansionChanged.value = value;
                  controller.indexExpansionChanged.value = index;
                },
                initiallyExpanded: false,
                shape: Border.all(color: Colors.transparent),
                trailing: Obx(() {
                  return controller.isExpansionChanged.value == true &&
                          controller.indexExpansionChanged.value == index
                      ? const CustomSvg("home/close-circle")
                      : const CustomSvg("home/plus_sq");
                }),
                backgroundColor: Colors.grey[50],
                children: [
                  SizedBox(height: 10.h),
                  Text(
                      "المقصود بذلك هو في حال عجز أو أهمل المستأجر تأدية التزاماته الواردة في العقد أو تلك الالتزامات المفروضة عليه بموجب القوانين.",
                      style: Theme.of(context).textTheme.bodyMedium!),
                ],
              ),
              index == 3 ? Container() : const Divider()
            ])));
  }
}
