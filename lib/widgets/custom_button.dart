import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/app_constants.dart';

// ignore: must_be_immutable
class CustomPrimaryButton extends StatelessWidget {
  CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.width = 350,
  }) : super(key: key);

  String text;
  VoidCallback onPressed;
  double width;
  bool? isDisabled;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled == true ? null : onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.style,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Row(
        children: [
          Text(text, style: style),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_circle_left_outlined),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPress,
    this.background,
    this.enable = true,
    this.isOutlined = false,
    this.icon,
    this.borderRadius,
  }) : super(key: key);

  String text;
  Color color;
  Color? background;
  Function() onPress;
  double? borderRadius;

  bool? isOutlined;
  bool? enable;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enable == true ? onPress : null,
      style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all(
        //   enable == true ? background ?? Colors.transparent : AppColors.grey50,
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? kBorderRadius,
            ),
            side: BorderSide(
              color: isOutlined == true ? color : Colors.transparent,
            ),
          ),
        ),
        // overlayColor: enable == true
        //     ? MaterialStateProperty.all(
        //         color.withOpacity(.1),
        //       )
        //     : MaterialStateProperty.all(
        //         AppColors.grey.withOpacity(.1),
        //       ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              // color: enable == true ? color : AppColors.black50,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.color,
  }) : super(key: key);

  IconData icon;
  Function() onTap;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        // color: color ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(kBorderRadius),
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 1,
            // color: AppColors.grey.withOpacity(.5),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // splashColor:
          //     color?.withOpacity(.1) ?? AppColors.primaryColor.withOpacity(.1),
          // highlightColor: AppColors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(kBorderRadius),
          onTap: onTap,
          child: Icon(
            icon,
            // color: AppColors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
