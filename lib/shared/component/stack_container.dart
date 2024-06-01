import 'package:flutter/material.dart';
// import 'package:responsive/module/cart.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget stckContainer(
  BuildContext context, {
  dynamic image,
  dynamic name,
}) {
  var width = MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  var height = MediaQuery.of(context).orientation == Orientation.landscape
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  return Container(
    margin: EdgeInsets.only(left: width * 0.02),
    width: width * 0.25,
    decoration: BoxDecoration(
        color: SharedColor.whiteColor, borderRadius: BorderRadius.circular(15)),
    child: Stack(children: [
      Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          bottom: height * 0.03,
          child: Container(
            padding: EdgeInsets.only(top: height * 0.02),
            alignment: Alignment.topCenter,
            child: customText(
                text: name.toString(),
                color: SharedColor.blackColor,
                fontSize: width * 0.05),
          )),
      Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            height: height * 0.07,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(width * (15 / width)),
                    bottomRight: Radius.circular(width * (15 / width))),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/fruits_category.jpg"))),
          )),
      Positioned(
        top: height * 0.06,
        bottom: height * 0.04,
        left: width * 0.05,
        right: width * 0.05,
        child: Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.all(width * (5 / width)),
          decoration: const BoxDecoration(
              color: SharedColor.whiteColor, shape: BoxShape.circle),
          child: CircleAvatar(
              radius: width * 0.06,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: const Image(
                  image: AssetImage("assets/category_icon.png"),
                  fit: BoxFit.fill,
                ),
              )),
        ),
      ),
    ]),
  );
}
