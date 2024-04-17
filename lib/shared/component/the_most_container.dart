import 'package:flutter/material.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget theMostContainer(BuildContext context) {
  var width = MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  var height = MediaQuery.of(context).orientation == Orientation.landscape
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  return Container(
    decoration: BoxDecoration(
      color: SharedColor.whiteColor,
      borderRadius: BorderRadius.circular(
        width * (15 / width),
      ),
    ),
    child: Stack(children: [
      Positioned(
        top: height * 0.027,
        child: Container(
            padding: EdgeInsets.only(right: width * 0.01),
            width: width * 0.1,
            decoration: BoxDecoration(
                color: SharedColor.greenColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * (15 / width)),
                    bottomLeft: Radius.circular(width * (15 / width)))),
            child: customText(
                text: "جديد",
                color: SharedColor.whiteColor,
                fontSize: width * 0.04)),
      ),
      Positioned(
        top: height * 0.02,
        left: width * 0.02,
        child: Icon(
          Icons.favorite,
          color: SharedColor.greenColor,
          size: width * 0.08,
        ),
      ),
      Positioned(
        top: height * 0.055,
        left: width * 0.01,
        right: width * 0.01,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: height * 0.12,
              color: SharedColor.whiteColor,
              child: const Image(
                image: AssetImage("assets/fruits.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width * 0.03, top: height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          right: width * 0.02, left: height * 0.02),
                      width: width * 0.17,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(width * (15 / width)),
                              bottomRight:
                                  Radius.circular(width * (15 / width)),
                              topLeft: Radius.circular(width * (15 / width)),
                              bottomLeft:
                                  Radius.circular(width * (15 / width)))),
                      child: customText(
                          text: "فواكة",
                          color: SharedColor.whiteColor,
                          fontSize: width * 0.04)),
                  customText(
                      text: "طبق فواكة",
                      color: SharedColor.greyColor,
                      fontSize: width * 0.03),
                  customText(
                      text: "KG 1",
                      color: SharedColor.greyColor,
                      fontSize: width * 0.03)
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: height * 0.04,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.005, horizontal: width * 0.01),
            decoration: BoxDecoration(
                color: SharedColor.greyColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width * (15 / width)),
                    bottomLeft: Radius.circular(width * (15 / width)))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(
                      text: "SAR 40",
                      color: SharedColor.blackColor,
                      fontSize: width * 0.04),
                  CircleAvatar(
                    backgroundColor: SharedColor.redColor,
                    child: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: SharedColor.whiteColor,
                      size: width * 0.05,
                    ),
                  )
                ]),
          ))
    ]),
  );
}
