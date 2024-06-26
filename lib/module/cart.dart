import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/cart/cart_cubit/get_cart_data_cubit/get_cart_data_cubit.dart';
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
    return BlocBuilder<GetCartDataCubit, GetCartDataState>(
      builder: (context, state) {
        if (state is GetCartDataIsLoading) {
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
                      right: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.w
                          : 10.h,
                      left: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5.w
                          : 5.h),
                  decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.h
                          : 10.w,
                      bottom: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.h
                          : 10.w,
                      left: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5.w
                          : 5.h,
                      right: MediaQuery.of(context).orientation ==
                              Orientation.portrait
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
            body: const Center(
              child: CircularProgressIndicator(
                color: SharedColor.greenColor,
              ),
            ),
          );
        } else if (state is GetCartDataSuccess) {
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
                      right: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.w
                          : 10.h,
                      left: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5.w
                          : 5.h),
                  decoration: BoxDecoration(
                      color: SharedColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.h
                          : 10.w,
                      bottom: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 10.h
                          : 10.w,
                      left: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 5.w
                          : 5.h,
                      right: MediaQuery.of(context).orientation ==
                              Orientation.portrait
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
                      Expanded(
                        child: SizedBox(
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: GetCartDataCubit.notes.length,
                              itemBuilder: (context, index) {
                                return horizontalContainer(
                                  context,
                                  name:
                                      GetCartDataCubit.notes[index].name ?? "",
                                  quantity:
                                      GetCartDataCubit.notes[index].quality,
                                  image: GetCartDataCubit
                                          .notes[index].productPhoto ??
                                      "",
                                  price:
                                      GetCartDataCubit.notes[index].price ?? 0,
                                  size: GetCartDataCubit.notes[index].type,
                                  increment: () {
                                    // ignore: avoid_function_literals_in_foreach_calls
                                    GetCartDataCubit.notes.forEach(
                                      (element) {
                                        GetCartDataCubit.totalPrice +=
                                            (element.price! *
                                                element.quality.toDouble());
                                      },
                                    );
                                    setState(() {
                                      GetCartDataCubit.notes[index].quality++;
                                      GetCartDataCubit.notes[index].save();
                                      BlocProvider.of<GetCartDataCubit>(context)
                                          .fetchAllNotes();
                                    });
                                  },
                                  deletFun: () {
                                    GetCartDataCubit.notes[index].delete();
                                    BlocProvider.of<GetCartDataCubit>(context)
                                        .fetchAllNotes();
                                  },
                                  decrement: () {
                                    if (GetCartDataCubit.notes[index].quality >
                                        0) {
                                      GetCartDataCubit.notes[index].quality--;
                                      GetCartDataCubit.notes[index].save();
                                      BlocProvider.of<GetCartDataCubit>(context)
                                          .fetchAllNotes();
                                    }
                                  },
                                );
                              },
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 10.h),
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
                                      text: "${GetCartDataCubit.totalPrice}",
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
                                    text: "${GetCartDataCubit.totalPrice} SAP",
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
                        onTap: () {
                          if (GetCartDataCubit.notes.isNotEmpty) {
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: SizedBox(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Center(
                                    child: customText(
                                      text: "Your Cart is Empty",
                                      color: SharedColor.greenColor,
                                      fontSize: 25.sp,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ]),
                  )
                : Row(
                    children: [
                      SizedBox(
                          width: 500.w,
                          height: double.infinity,
                          child: ListView.builder(
                            itemCount: GetCartDataCubit.notes.length,
                            itemBuilder: (context, index) {
                              return horizontalContainer(
                                context,
                                name: GetCartDataCubit.notes[index].name ?? "",
                                quantity: GetCartDataCubit.notes[index].quality,
                                image: GetCartDataCubit
                                        .notes[index].productPhoto ??
                                    "",
                                price: GetCartDataCubit.notes[index].price ?? 0,
                                increment: () {
                                  // ignore: avoid_function_literals_in_foreach_calls
                                  GetCartDataCubit.notes.forEach(
                                    (element) {
                                      GetCartDataCubit.totalPrice +=
                                          (element.price! *
                                              element.quality.toDouble());
                                    },
                                  );
                                  setState(() {
                                    GetCartDataCubit.notes[index].quality++;
                                    GetCartDataCubit.notes[index].save();
                                    BlocProvider.of<GetCartDataCubit>(context)
                                        .fetchAllNotes();
                                  });
                                },
                                deletFun: () {
                                  GetCartDataCubit.notes[index].delete();
                                  BlocProvider.of<GetCartDataCubit>(context)
                                      .fetchAllNotes();
                                },
                                size: GetCartDataCubit.notes[index].type,
                                decrement: () {
                                  if (GetCartDataCubit.notes[index].quality >
                                      0) {
                                    GetCartDataCubit.notes[index].quality--;
                                    GetCartDataCubit.notes[index].save();
                                    BlocProvider.of<GetCartDataCubit>(context)
                                        .fetchAllNotes();
                                  }
                                },
                              );
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText(
                                            text: "4",
                                            color: SharedColor.cartColor,
                                            fontSize: 17.sp,
                                          ),
                                          customText(
                                            text:
                                                "${GetCartDataCubit.totalPrice ?? 0}",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      customText(
                                          text: "الاجمالي",
                                          color: SharedColor.blackColor,
                                          fontSize: 23.sp,
                                          fontWeight: FontWeight.bold),
                                      customText(
                                          text:
                                              "${GetCartDataCubit.totalPrice ?? 0}",
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
                              onTap: () {
                                if (GetCartDataCubit.notes.isNotEmpty) {
                                  // Navigator.of(context).push(
                                  //   PageRouteBuilder(
                                  //     pageBuilder: (context, animation, secondaryAnimation) =>
                                  //         const ShopingScreen(),
                                  //   ),
                                  // );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: SizedBox(
                                        width: 100.w,
                                        height: 100.h,
                                        child: Center(
                                          child: customText(
                                            text: "Your Cart is Empty",
                                            color: SharedColor.greenColor,
                                            fontSize: 25.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
