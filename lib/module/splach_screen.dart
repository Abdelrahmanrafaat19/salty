import 'package:flutter/material.dart';
import 'package:responsive/layout/page_view.dart';
import 'package:responsive/shared/theme/color.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const PageViewDot(),
        ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.25,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/Salty.jpeg"))),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: SizedBox(
              width: width * (100 / width),
              height: height * (100 / height),
              child: CircularProgressIndicator(
                color: SharedColor.greenColor,
                strokeWidth: width * (5 / width),
              ),
            ),
          )
        ],
      ),
    );
  }
}
