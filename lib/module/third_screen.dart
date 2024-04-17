import 'package:flutter/material.dart';
import 'package:responsive/shared/component/pages_page_veiw.dart';
import 'package:responsive/shared/theme/color.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pagesPageView(
            context: context,
            firstColor: SharedColor.frgrey,
            secandColor: SharedColor.greyColor,
            firstText: "تسليم سريع للمنزل",
            secandText: "الجميع يعمل بكفائة لتوصيل احتياجاتك في اقل وقت ممكن",
            pass: "assets/fast.png",
            thirdColor: SharedColor.thgrey));
  }
}
