import 'package:flutter/material.dart';

Widget custamButtom(
    {required Color color,
    required Widget text,
    required double paddingHersontal,
    required double paddingVertical,
    double radius = 0.0,
    required var onTap}) {
  return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHersontal,
          vertical: paddingVertical,
        ),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius)),
        child: text,
      ));
}
