import 'package:flutter/material.dart';
import 'package:responsive/shared/component/pages_page_veiw.dart';
import 'package:responsive/shared/theme/color.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pagesPageView(
            context: context,
            firstColor: SharedColor.frpink,
            secandColor: SharedColor.scpink,
            firstText: "البحث بالقرب منك",
            secandText: "البحث بالقرب منك",
            pass: "assets/store.png",
            thirdColor: SharedColor.redColor));
  }
}
