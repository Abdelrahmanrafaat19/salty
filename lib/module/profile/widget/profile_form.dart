import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/theme/color.dart';

class ProfileForm extends StatelessWidget {
  String name, phoneNumber, email;
  ProfileForm(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          initialValue: name,
          style: TextStyle(
            color: SharedColor.blackColor,
            fontSize: 20.w,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            enabled: false,
            label: Text(
              "الإسم",
              style: TextStyle(
                color: const Color.fromARGB(255, 118, 115, 115),
                fontWeight: FontWeight.w700,
                fontSize: 25.w,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 118, 115, 115),
                width: 3.h,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        TextFormField(
          initialValue: email,
          style: TextStyle(
            color: SharedColor.blackColor,
            fontSize: 20.w,
          ),
          enabled: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            label: Text(
              "البريد الالكتروني",
              style: TextStyle(
                color: const Color.fromARGB(255, 118, 115, 115),
                fontWeight: FontWeight.w700,
                fontSize: 25.w,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 118, 115, 115),
                width: 3.h,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        TextFormField(
          initialValue: phoneNumber,
          style: TextStyle(
            color: SharedColor.blackColor,
            fontSize: 20.w,
          ),
          enabled: false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            label: Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Text(
                "رقم الهاتف",
                style: TextStyle(
                  color: const Color.fromARGB(255, 118, 115, 115),
                  fontWeight: FontWeight.w700,
                  fontSize: 25.w,
                ),
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 118, 115, 115),
                width: 3.h,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
