import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProfileImageContainer extends StatelessWidget {
  String imagePass;
  ProfileImageContainer({super.key, required this.imagePass});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w,
      height: 170.h,
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        image:
            DecorationImage(fit: BoxFit.fill, image: NetworkImage(imagePass)),
        shape: BoxShape.circle,
        color: Colors.black,
      ),
    );
  }
}
