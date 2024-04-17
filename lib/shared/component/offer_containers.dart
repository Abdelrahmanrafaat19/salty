import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget offerContainer(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                    color: const Color(0xffc460da),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: "عرض",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                      customText(
                          text: "30%",
                          color: SharedColor.whiteColor,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold),
                      customText(
                        text: "خصم",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                    color: const Color(0xff35a2ff),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: "عرض",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                      customText(
                          text: "40%",
                          color: SharedColor.whiteColor,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold),
                      customText(
                        text: "خصم",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 10.w, left: 10.w),
                decoration: BoxDecoration(
                    color: const Color(0xffff5556),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: "عرض",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                      customText(
                          text: "50%",
                          color: SharedColor.whiteColor,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.bold),
                      customText(
                        text: "خصم",
                        color: SharedColor.whiteColor,
                        fontSize: 25.sp,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xffc460da),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          text: "اشتري 1",
                          color: SharedColor.whiteColor,
                          fontSize: 20.sp,
                        ),
                        customText(
                          text: "واحصل علي 1",
                          color: SharedColor.whiteColor,
                          fontSize: 20.sp,
                        ),
                        customText(
                            text: "خصم",
                            color: SharedColor.whiteColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xff35a2ff),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                            text: "اقل",
                            color: SharedColor.whiteColor,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                        customText(
                            text: "99SAR",
                            color: SharedColor.whiteColor,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 10.w, left: 10.w),
                  decoration: BoxDecoration(
                      color: const Color(0xffff5556),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                            text: "اختيارات",
                            color: SharedColor.whiteColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                        customText(
                            text: "الشهر",
                            color: SharedColor.whiteColor,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
