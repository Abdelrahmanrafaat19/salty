import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget horizontalContainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    width: double.infinity,
    height: MediaQuery.of(context).orientation == Orientation.portrait
        ? 130.h
        : 130.w,
    decoration: BoxDecoration(
        color: SharedColor.whiteColor,
        borderRadius: BorderRadius.circular(15.r)),
    child: Row(children: [
      Container(
        margin: EdgeInsets.only(right: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.add,
              color: SharedColor.blackColor,
              size: 30.w,
            ),
            customText(
              text: "1",
              color: SharedColor.blackColor,
              fontSize: 25.sp,
            ),
            Icon(
              Icons.remove,
              color: SharedColor.blackColor,
              size: 30.w,
            ),
          ],
        ),
      ),
      Container(
          width: 120.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: const BoxDecoration(
            color: SharedColor.whiteColor,
          )),
      Container(
        margin: EdgeInsets.only(right: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
              text: "3500\$x1",
              color: SharedColor.greenColor,
              fontSize: 20.sp,
            ),
            customText(
                text: "كمثري امريكي",
                color: SharedColor.blackColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
            customText(
              text: "1KG",
              color: SharedColor.blackColor,
              fontSize: 20.sp,
            ),
          ],
        ),
      ),
    ]),
  );
}
