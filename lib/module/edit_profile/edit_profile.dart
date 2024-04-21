import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/shared/theme/color.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColor.greyBackGround,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 50.h,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: const Color(0xff123456),
            size: 40.w,
          ),
        ),
        title: Text(
          "تعديل بيانات الملف الشخصي",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 25.w,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
