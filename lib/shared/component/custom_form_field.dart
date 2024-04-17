import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget custamTextFormField({
  required Color borderColor,
  required String labelText,
  required String hintText,
  required var validator,
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(fontSize: 15.sp)),
    validator: validator,
  );
}
