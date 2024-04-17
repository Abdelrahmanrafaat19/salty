import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/module/choose_screen.dart';
import 'package:responsive/module/first_screen.dart';
import 'package:responsive/module/second_screen.dart';
import 'package:responsive/module/third_screen.dart';
import 'package:responsive/shared/theme/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewDot extends StatefulWidget {
  const PageViewDot({super.key});

  @override
  State<PageViewDot> createState() => _PageViewDotState();
}

class _PageViewDotState extends State<PageViewDot> {
  PageController pageController = PageController();
  Color changableColor = SharedColor.redColor;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    var widthOnly = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return Builder(builder: (context) {
      return Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            controller: pageController,
            children: const [FirstScreen(), SecoandScreen(), ThirdScreen()],
            onPageChanged: (value) {
              setState(() {});
            },
          ),
          Positioned(
              right: -1.0,
              top: 600,
              bottom: 0.0,
              child: Container(
                width: 300,
                height: 00,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.1,
                        scale: 70,
                        image: AssetImage("assets/logo.png"),
                        fit: BoxFit.contain)),
              )),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? height * (20 / height)
                        : 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        textDirection: TextDirection.ltr,
                        effect:
                            ExpandingDotsEffect(activeDotColor: changableColor),
                        onDotClicked: (index) {
                          setState(() {
                            if (index == 1) {
                              changableColor = SharedColor.greenColor;
                            } else {
                              changableColor = SharedColor.thgrey;
                            }
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? widthOnly * 0.5
                          : widthOnly * 0.7,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: 50.w,
                      child: FloatingActionButton(
                        backgroundColor: changableColor,
                        onPressed: () {
                          if (pageController.page!.round() < 2) {
                            setState(() {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              if (pageController.page!.round() == 0) {
                                changableColor = SharedColor.greenColor;
                              } else {
                                changableColor = SharedColor.thgrey;
                              }
                            });
                          } else {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const ChooseScreen(),
                            ));
                          }
                          setState(() {});
                        },
                        shape: const CircleBorder(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: SharedColor.whiteColor,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      );
    });
  }
}
