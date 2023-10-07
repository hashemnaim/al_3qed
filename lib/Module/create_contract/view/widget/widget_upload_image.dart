import 'package:al_3qed/core/constants/app_string.dart';
import 'package:al_3qed/core/constants/images_path.dart';
import 'package:al_3qed/core/utils/spaces.dart';
import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetUploadImage extends StatelessWidget {
  const WidgetUploadImage(
      {super.key,
      this.onTap,
      required this.notImage,
      required this.title,
      required this.buttonText});
  final void Function()? onTap;
  final bool notImage;
  final String title;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,

          // "سوف يتم اضافة 55 ر.س على السعر الأصلي",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: const Color(0xffB7B7B7))),
      const SpaceH10(),
      GestureDetector(
          onTap: onTap,
          child: Container(
              height: 48.h,
              decoration: customDecoration(),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const CustomSvg(ImagePaths.galleryExport),
                const SpaceW16(),
                Text(notImage ? buttonText : AppString.photoAattached,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: const Color(0xffB7B7B7)))
              ]))),
    ]);
  }
}
//  "الرجاء ارفاق صورة الصك (PNG,JPG)"

BoxDecoration customDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.r),
    border: Border.all(color: Colors.grey[200]!),
  );
}
