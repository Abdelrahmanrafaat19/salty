import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/theme/color.dart';

Widget pagesPageView({
  required BuildContext context,
  required Color firstColor,
  required Color secandColor,
  required Color thirdColor,
  required String firstText,
  required String secandText,
  required String pass,
}) {
  var width = MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  var height = MediaQuery.of(context).orientation == Orientation.landscape
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
  print(height);
  return SingleChildScrollView(
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              children: [
                SizedBox(
                  height: height * (90 / height),
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: width * (150 / width),
                    backgroundColor: firstColor,
                    child: CircleAvatar(
                      radius: width * (120 / width),
                      backgroundColor: secandColor,
                      child: CircleAvatar(
                        radius: width * (90 / width),
                        backgroundColor: thirdColor,
                        child: Image.asset(
                          pass,
                          width: width * (130 / width),
                          height: height * (130 / height),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * (50 / height),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * (15 / width)),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        fontWeight: FontWeight.w700,
                        text: firstText,
                        color: thirdColor,
                        fontSize: width * (45 / width)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * (15 / width)),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        fontWeight: FontWeight.w600,
                        text: secandText,
                        color: SharedColor.blackColor,
                        fontSize: width * (30 / width)),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: width * 0.25,
                    backgroundColor: firstColor,
                    child: CircleAvatar(
                      radius: width * 0.15,
                      backgroundColor: secandColor,
                      child: CircleAvatar(
                          radius: width * 0.09,
                          backgroundColor: thirdColor,
                          child: ImageIcon(
                            AssetImage(pass),
                            color: SharedColor.whiteColor,
                            size: 50.w,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.026),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        fontWeight: FontWeight.w700,
                        text: firstText,
                        color: thirdColor,
                        fontSize: width * 0.09),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.026),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        fontWeight: FontWeight.w600,
                        text: secandText,
                        color: SharedColor.blackColor,
                        fontSize: width * 0.05),
                  ),
                ),
              ],
            ));
}
