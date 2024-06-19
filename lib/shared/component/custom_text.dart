import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    required Color color,
    required double fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    TextOverflow? overflow = TextOverflow.ellipsis}) {
  return Text(
    text,
    style: TextStyle(
        overflow: overflow,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily),
  );
}
