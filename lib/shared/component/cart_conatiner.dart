import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget horizontalContainer(BuildContext context,
    {required String name,
    required String image,
    required dynamic quantity,
    required dynamic price,
    required dynamic size,
    required void Function()? increment,
    required void Function()? decrement,
    required void Function()? deletFun}) {
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
      Expanded(
        child: Container(
          margin: EdgeInsets.only(right: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: increment,
                child: Icon(
                  Icons.add,
                  color: SharedColor.blackColor,
                  size: 30.w,
                ),
              ),
              customText(
                text: "$quantity",
                color: SharedColor.blackColor,
                fontSize: 25.sp,
              ),
              GestureDetector(
                onTap: decrement,
                child: Icon(
                  Icons.remove,
                  color: SharedColor.blackColor,
                  size: 30.w,
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          margin: EdgeInsets.only(right: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                text: "$price",
                color: SharedColor.greenColor,
                fontSize: 20.sp,
              ),
              customText(
                  text: "$name",
                  color: SharedColor.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
              customText(
                text: "$size",
                color: SharedColor.blackColor,
                fontSize: 20.sp,
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: deletFun,
          child: Icon(
            Icons.delete,
            color: SharedColor.blackColor,
            size: 30.w,
          ),
        ),
      ),
    ]),
  );
}
