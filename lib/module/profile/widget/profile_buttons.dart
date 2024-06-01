import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/module/change_password_Screen.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class PofileButtons extends StatelessWidget {
  const PofileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            custamButtom(
              radius: 20.r,
              color: const Color.fromARGB(255, 118, 115, 115),
              text: Text(
                "تغير كلمة السر",
                style: TextStyle(
                  color: SharedColor.blackColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w700,
                ),
              ),
              paddingHersontal: 15.w,
              paddingVertical: 5.h,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordScreen(),
                  ),
                );
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            custamButtom(
              radius: 20.r,
              color: const Color.fromARGB(255, 118, 115, 115),
              text: Text(
                "تعديل الملف الشخصي",
                style: TextStyle(
                  color: SharedColor.blackColor,
                  fontSize: 20.w,
                  fontWeight: FontWeight.w700,
                ),
              ),
              paddingHersontal: 15.w,
              paddingVertical: 5.h,
              onTap: () {},
            ),
          ],
        ));
  }
}
