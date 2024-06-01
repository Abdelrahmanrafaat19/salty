import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/responsive_text.dart';
import 'package:responsive/shared/theme/color.dart';

import '../model/product_model/product_model/product.dart';

class CategouriesScreen extends StatefulWidget {
  final List<Product> product;
  const CategouriesScreen({super.key, required this.product});

  @override
  State<CategouriesScreen> createState() => _CategouriesScreenState();
}

class _CategouriesScreenState extends State<CategouriesScreen> {
  @override
  Widget build(BuildContext context) {
/*     var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height; */

    return Scaffold(
      backgroundColor: SharedColor.greyBackGround,
      appBar: AppBar(
        toolbarHeight:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? 70.h
                : 70.w,
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(
              right: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 5.w
                  : 5.h,
              bottom: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 10.h
                  : 10.h,
              top: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 10.h
                  : 10.h,
              left: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 5.w
                  : 5.h),
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
              text: "التصنيفات",
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
                bottom:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 10.h
                        : 10.w,
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 10.h
                    : 10.w,
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
      body: Container(
        margin: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
        ),
        child: Center(
          child: GridView.builder(
            itemCount: widget.product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 15.w),
            itemBuilder: (context, index) {
              return Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: SharedColor.whiteColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(children: [
                  Positioned(
                      child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? 25.h
                            : 5.w),
                    alignment: Alignment.topCenter,
                    child: customText(
                      text: widget.product[index].name.toString(),
                      color: SharedColor.blackColor,
                      fontSize: getResponsiveFont(context, fontSize: 30),
                    ),
                  )),
                  Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: Container(
                        height: 65.h,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r)),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/fruits_category.jpg"))),
                      )),
                  Positioned(
                    top: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 110.h
                        : 70.w,
                    left: 50.w,
                    right: 50.w,
                    child: CircleAvatar(
                      radius: 45.r,
                      backgroundColor: SharedColor.whiteColor,
                      child: CircleAvatar(
                          radius: 35.r,
                          backgroundColor: Colors.yellow,
                          child: const Image(
                            image: AssetImage("assets/category_icon.png"),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
