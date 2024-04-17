import 'package:flutter/material.dart';
import 'package:responsive/shared/component/pages_page_veiw.dart';
import 'package:responsive/shared/theme/color.dart';

class SecoandScreen extends StatelessWidget {
  const SecoandScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pagesPageView(
            context: context,
            firstColor: SharedColor.frgreen,
            secandColor: SharedColor.scgreen,
            firstText: "عروض طازجة",
            secandText: "جميع العناصر لها نضارة حقيقية وهي مخصصة لاحتياجاتك",
            pass: "assets/store.png",
            thirdColor: SharedColor.greenColor));
  }
}
