import 'package:al_3qed/Module/notification/notification_screen.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetAppBarHome extends StatelessWidget {
  WidgetAppBarHome({super.key, this.imageActions = "", this.onTap});
  String? imageActions;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomAssetsImage(
          ImagePaths.logo,
          fit: BoxFit.contain,
          height: 38,
        ),
      ),
      centerTitle: true,
      leadingWidth: 50,
      actions: [
        imageActions == null
            ? Container()
            : InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: CustomSvg(imageActions),
                ),
              ),
      ],
      leading: GestureDetector(
        onTap: () => Get.to(() => const NotificationScreen()),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CustomSvg(ImagePaths.notification),
        ),
      ),
    );
  }
}
