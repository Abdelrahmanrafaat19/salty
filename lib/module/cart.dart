import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/cart_conatiner.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColor.greyBackGround,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 50.h,
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Container(
          width: 20.w,
          decoration: BoxDecoration(
              color: SharedColor.whiteColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Icon(
            Icons.save,
            color: SharedColor.cartColor,
            size: 25.sp,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: customText(
              text: "عربة التسوق",
              color: SharedColor.blackColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
                right:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 10.w
                        : 10.h,
                left: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 5.w
                    : 5.h),
            decoration: BoxDecoration(
                color: SharedColor.whiteColor,
                borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 10.h
                    : 10.w,
                bottom:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 10.h
                        : 10.w,
                left: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 5.w
                    : 5.h,
                right:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 5.w
                        : 5.h),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_forward_ios,
                color: SharedColor.cartColor,
                size: 30.w,
              ),
            ),
          ),
        ],
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Container(
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(children: [
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return horizontalContainer(context);
                      },
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "البنود",
                                color: SharedColor.cartColor,
                                fontSize: 20.sp,
                              ),
                              customText(
                                text: "المجموع الفرعي",
                                color: SharedColor.cartColor,
                                fontSize: 20.sp,
                              ),
                              customText(
                                text: "رسوم التوصيل",
                                color: SharedColor.cartColor,
                                fontSize: 20.sp,
                              ),
                            ],
                          ),
                          Container(
                              width: 120.w,
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: const BoxDecoration(
                                color: SharedColor.whiteColor,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "4",
                                color: SharedColor.cartColor,
                                fontSize: 17.sp,
                              ),
                              customText(
                                text: "100.000\$",
                                color: SharedColor.cartColor,
                                fontSize: 17.sp,
                              ),
                              customText(
                                text: "Free",
                                color: SharedColor.cartColor,
                                fontSize: 17.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                              text: "الاجمالي",
                              color: SharedColor.blackColor,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold),
                          customText(
                              text: " 100.00 SAR",
                              color: SharedColor.blackColor,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                custamButtom(
                    radius: 15.r,
                    color: SharedColor.greenColor,
                    text: customText(
                      text: "الدفع",
                      color: SharedColor.whiteColor,
                      fontSize: 25.sp,
                    ),
                    paddingHersontal: 150.w,
                    paddingVertical: 5.h,
                    onTap: () {})
              ]),
            )
          : Row(
              children: [
                SizedBox(
                    width: 500.w,
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return horizontalContainer(context);
                      },
                    )),
                SizedBox(
                  height: double.infinity,
                  width: 300.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 10.w, right: 10.w, bottom: 10.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
                        width: double.infinity,
                        height: 130.h,
                        decoration: BoxDecoration(
                            color: SharedColor.whiteColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      text: "البنود",
                                      color: SharedColor.cartColor,
                                      fontSize: 20.sp,
                                    ),
                                    customText(
                                      text: "المجموع الفرعي",
                                      color: SharedColor.cartColor,
                                      fontSize: 20.sp,
                                    ),
                                    customText(
                                      text: "رسوم التوصيل",
                                      color: SharedColor.cartColor,
                                      fontSize: 20.sp,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                      text: "4",
                                      color: SharedColor.cartColor,
                                      fontSize: 17.sp,
                                    ),
                                    customText(
                                      text: "100.000\$",
                                      color: SharedColor.cartColor,
                                      fontSize: 17.sp,
                                    ),
                                    customText(
                                      text: "Free",
                                      color: SharedColor.cartColor,
                                      fontSize: 17.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customText(
                                    text: "الاجمالي",
                                    color: SharedColor.blackColor,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
                                customText(
                                    text: " 100.00 SAR",
                                    color: SharedColor.blackColor,
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ],
                        ),
                      ),
                      custamButtom(
                          radius: 15.r,
                          color: SharedColor.greenColor,
                          text: customText(
                              text: "الدفع",
                              color: SharedColor.whiteColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                          paddingHersontal: 115.w,
                          paddingVertical: 5.h,
                          onTap: () {}),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
