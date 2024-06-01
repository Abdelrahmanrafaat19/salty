import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/layout/bottom_navigatin_bar.dart';
import 'package:responsive/module/ctegores.dart';
import 'package:responsive/module/profile/profile.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/offer_containers.dart';
import 'package:responsive/shared/component/stack_container.dart';
import 'package:responsive/shared/component/the_most_container.dart';
import 'package:responsive/shared/responsive_text.dart';
import 'package:responsive/shared/theme/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthOnly = MediaQuery.of(context).size.width;
    // var heightOnly = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: SharedColor.greyBackGround,
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Container(
          padding: EdgeInsets.all(width * (5 / width)),
          decoration: const BoxDecoration(
              color: SharedColor.whiteColor, shape: BoxShape.circle),
          child: const ClipOval(
              child: Image(
            image: AssetImage("assets/BoDa.jpg"),
            fit: BoxFit.fill,
          )),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(
                text: "عبد الرحمن رأفت شعيب",
                color: SharedColor.blackColor,
                fontSize: width * (20 / width)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: width * (13 / width),
                  backgroundColor: SharedColor.whiteColor,
                  child: const Icon(
                    Icons.location_on,
                    color: SharedColor.redColor,
                  ),
                ),
                customText(
                    text: "المنوفية -الباجور",
                    color: SharedColor.greyColor,
                    fontSize: width * (20 / width)),
              ],
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            )),
            child: Container(
              margin: EdgeInsets.only(left: width * (10 / width)),
              alignment: Alignment.center,
              width: width * (40 / width),
              height: height * (40 / height),
              decoration: BoxDecoration(
                  color: SharedColor.whiteColor,
                  borderRadius: BorderRadius.circular(width * (10 / width))),
              child: Icon(
                Icons.save_outlined,
                color: SharedColor.greyColor,
                size: width * (30 / width),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: width * (15 / width)),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * (50 / width),
                  height: height * (50 / height),
                  decoration: BoxDecoration(
                    color: SharedColor.redColor,
                    borderRadius: BorderRadius.circular(width * (10 / width)),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: SharedColor.whiteColor,
                    size: width * (40 / width),
                  ),
                ),
                Container(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? widthOnly * 0.83
                          : widthOnly * 0.9,
                  height: height * (50 / height),
                  decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      borderRadius:
                          BorderRadius.circular(width * (10 / width))),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customText(
                            text: "البحث عن المنتجات",
                            color: SharedColor.greyColor,
                            fontSize: getResponsiveFont(context, fontSize: 20),
                            fontWeight: FontWeight.bold),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: SharedColor.greyColor,
                        ),
                        onPressed: () {
                          _searchController.clear();
                        },
                      ),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText(
                          text: "القيمة الافضل",
                          color: SharedColor.blackColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        width: width * (10 / width),
                      ),
                      customText(
                          text: "اعلي المبيعات",
                          color: SharedColor.greyColor,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_left,
                          color: SharedColor.greyColor, size: width * 0.06),
                      customText(
                          text: "مشاهدة الكل",
                          color: SharedColor.greyColor,
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(top: height * 0.01, right: width * 0.01),
                height: height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return containerTheBest(width: width * 0.8, height: 1);
                  },
                )),
            Container(
              margin: EdgeInsets.only(
                  right: width * 0.01,
                  top: height * 0.015,
                  bottom: height * 0.015),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                          text: "التصنيفات",
                          color: SharedColor.blackColor,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold),
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(page: const CategouriesScreen()),
                        )),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_left,
                                color: SharedColor.greyColor,
                                size: width * 0.06),
                            customText(
                                text: "مشاهدة الكل",
                                color: SharedColor.greyColor,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? width.w
                  : height.h,
              height: height * 0.2,
              margin:
                  EdgeInsets.only(bottom: width * 0.04, right: width * 0.025),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return stckContainer(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      text: "الأكثر مبيعا",
                      color: SharedColor.blackColor,
                      fontSize: width * (23 / width),
                      fontWeight: FontWeight.bold),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_left,
                          color: SharedColor.greyColor,
                          size: width * (25 / width)),
                      customText(
                          text: "مشاهدة الكل",
                          color: SharedColor.greyColor,
                          fontSize: width * (15 / width),
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              )),
            ),
            Container(
              margin:
                  EdgeInsets.only(bottom: width * 0.04, right: width * 0.025),
              height: height * 0.6,
              child: Center(
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.2,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return theMostContainer(context);
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      text: "الأكثر مبيعا",
                      color: SharedColor.blackColor,
                      fontSize: width * (23 / width),
                      fontWeight: FontWeight.bold),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_left,
                          color: SharedColor.greyColor,
                          size: width * (25 / width)),
                      customText(
                          text: "مشاهدة الكل",
                          color: SharedColor.greyColor,
                          fontSize: width * (15 / width),
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              )),
            ),
            Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? width.w
                  : height.h,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 200.h
                  : 200.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/fruits_img.jpg"))),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      text: "تسويق حسب العروض",
                      color: SharedColor.blackColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_left,
                          color: SharedColor.greyColor, size: 25.sp),
                      customText(
                          text: "مشاهدة الكل",
                          color: SharedColor.greyColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              )),
            ),
            offerContainer(context),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SizedBox(
                  child: customText(
                      text: "طازج و سريع",
                      color: SharedColor.blackColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              margin:
                  EdgeInsets.only(bottom: width * 0.04, right: width * 0.025),
              height: height * 0.6,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.2,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return theMostContainer(context);
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? width.w
                  : height.h,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 200.h
                  : 200.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/fruits_img.jpg"))),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      text: "انتهز الفرصة",
                      color: SharedColor.blackColor,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_left,
                          color: SharedColor.greyColor, size: 25.sp),
                      customText(
                          text: "مشاهدة الكل",
                          color: SharedColor.greyColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ],
                  )
                ],
              )),
            ),
            Container(
              margin:
                  EdgeInsets.only(bottom: width * 0.04, right: width * 0.025),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 210.h
                  : 210.w,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? width.w
                  : height.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 170.w,
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Stack(children: [
                      Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: "طبق فواكة",
                                color: SharedColor.greyColor,
                                fontSize: 15.sp,
                              ),
                              customText(
                                text: "خصم 25% بدون فوائد",
                                color: SharedColor.blackColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 15.h
                                    : 15.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: height * 0.12,
                                color: SharedColor.whiteColor,
                                child: const Image(
                                  image: AssetImage("assets/fruits.png"),
                                ),
                              ),
                            ],
                          )),
                      Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 30.h
                                : 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.r),
                                    bottomRight: Radius.circular(15.r)),
                                color: SharedColor.greyColor),
                          )),
                      Positioned(
                          bottom: 10.h,
                          right: 10.w,
                          child: CircleAvatar(
                            radius: 17.r,
                            backgroundColor: SharedColor.redColor,
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: SharedColor.whiteColor,
                                size: 15.sp,
                              ),
                            ),
                          ))
                    ]),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget containerTheBest({required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
            image: AssetImage("assets/fruits_category.jpg"), fit: BoxFit.fill)),
  );
}
