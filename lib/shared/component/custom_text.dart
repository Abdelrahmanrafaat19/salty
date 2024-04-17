import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    required Color color,
    required double fontSize,
    FontWeight? fontWeight,
    String? fontFamily}) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily),
  );
}
