import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_text/skeleton_text.dart';

Widget loadingWidget() => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    padding: EdgeInsets.zero,
    child: Wrap(spacing: 8, children: [
      ...List.generate(4, (index) {
        return SkeletonAnimation(
            shimmerColor: Colors.grey[300]!,
            child: Container(
                width: 79.w,
                height: 35.h,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8))));
      })
    ]));

Widget loadingerticalWidget() => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    padding: EdgeInsets.zero,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(3, (index) {
            return SkeletonAnimation(
                shimmerColor: Colors.grey[300]!,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 151.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8)))));
          })
        ]));

Widget loadingWidget4() => SingleChildScrollView(
    padding: const EdgeInsets.only(top: 8),
    scrollDirection: Axis.vertical,
    child: Center(
      child: Wrap(runSpacing: 8.h, children: [
        ...List.generate(6, (index) {
          return SkeletonAnimation(
              shimmerColor: Colors.grey[300]!,
              child: Container(
                  width: 350.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8))));
        })
      ]),
    ));

Widget loadingWidget2() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Wrap(spacing: 8, children: [
      ...List.generate(2, (index) {
        return SkeletonAnimation(
            shimmerColor: Colors.grey[300]!,
            child: Container(
                width: 249.w,
                height: 316.h,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8))));
      })
    ]));

Widget loadingWidget3() => SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Wrap(spacing: 8, children: [
      ...List.generate(2, (index) {
        return SkeletonAnimation(
            shimmerColor: Colors.grey[300]!,
            child: Container(
                height: 103.h,
                width: 197.w,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8))));
      })
    ]));

Widget loadingWidgetBanner() => SkeletonAnimation(
    shimmerColor: Colors.grey[300]!,
    child: Container(
        height: 200.h,
        width: 350.w,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(8))));
Widget loadingWidget7() => SingleChildScrollView(
    scrollDirection: Axis.vertical,
    padding: EdgeInsets.zero,
    child: Wrap(spacing: 8, children: [
      ...List.generate(4, (index) {
        return SkeletonAnimation(
            shimmerColor: Colors.grey[300]!,
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    height: 50.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)))));
      })
    ]));
