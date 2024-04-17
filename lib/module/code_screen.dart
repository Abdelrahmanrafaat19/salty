import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/custome_button.dart';

import 'package:responsive/shared/theme/color.dart';

class CodeScreen extends StatelessWidget {
  const CodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var widthOnly = MediaQuery.of(context).size.width;

    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(right: widthOnly * (20 / widthOnly)),
          child: Icon(
            Icons.save,
            color: SharedColor.greyColor,
            size: width * (40 / width),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: width * (10 / width)),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_forward_ios,
                color: SharedColor.greyColor,
                size: width * (40 / width),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: widthOnly * (10 / widthOnly)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * (25 / height),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: customText(
                    text: "لقد أرسلنا لك رساله نصية قصيرة تحتوي علي رمز",
                    color: SharedColor.greyColor,
                    fontSize: width * (25 / width),
                  ),
                ),
                SizedBox(
                  height: height * (70 / height),
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: SharedColor.greyColor),
                        borderRadius:
                            BorderRadius.circular(width * (15 / width))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * (15 / width)),
                      borderSide:
                          const BorderSide(color: SharedColor.greyColor),
                    ),
                  ),
                  initialCountryCode: 'EG',
                  onChanged: (phone) {},
                ),
                SizedBox(
                  height: height * (25 / height),
                ),
                custamButtom(
                    radius: width * (15 / width),
                    color: SharedColor.greenColor,
                    text: customText(
                        text: "تأكيد",
                        color: SharedColor.whiteColor,
                        fontSize: width * (20 / width)),
                    paddingHersontal: widthOnly * (150 / widthOnly),
                    paddingVertical: widthOnly * (15 / widthOnly),
                    onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
