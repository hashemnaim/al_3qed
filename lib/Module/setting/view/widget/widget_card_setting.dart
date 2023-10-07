import 'package:al_3qed/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

class WidgetCardSetting extends StatelessWidget {
  WidgetCardSetting({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });
  String text, image;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CustomSvg(image),
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: const Color(0xff5F5F5F)),
      ),
    );
  }
}
