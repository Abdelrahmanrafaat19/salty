import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/module/login_screen.dart';
import 'package:responsive/module/signup_screen.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar()
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/salty2.jpeg"))),
            ),
            custamButtom(
                color: SharedColor.redColor,
                text: customText(
                    text: "تسجيل الدخول",
                    color: SharedColor.whiteColor,
                    fontSize: 25.sp),
                paddingHersontal: 120.w,
                paddingVertical: 10.h,
                radius: width * (10 / width),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                }),
            SizedBox(
              height: 25.h,
            ),
            custamButtom(
                color: SharedColor.greenColor,
                text: customText(
                    text: "أنشئ حساب",
                    color: SharedColor.whiteColor,
                    fontSize: 25.sp),
                paddingHersontal: 133.w,
                paddingVertical: 10.h,
                radius: 10.r,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
