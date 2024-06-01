import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:responsive/shared/theme/color.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  late Widget page;
  MyHomePage({super.key, required this.page});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // var widthOnly = MediaQuery.of(context).size.width;

    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    debugPrint("the Heigt is $height   the weidth is $width");
    return Scaffold(
        body: widget.page,
        bottomNavigationBar: ConvexAppBar(
          height: height * (70 / height),
          onTap: (index) => setState(() {}),
          initialActiveIndex: 2,
          color: SharedColor.bottomBarColor,
          activeColor: SharedColor.greenColor,
          backgroundColor: SharedColor.whiteColor,
          items: [
            const TabItem(
              icon: Icons.person_outline_rounded,
            ),
            const TabItem(
              icon: Icons.notifications_none_rounded,
            ),
            TabItem(
              icon: Center(
                child: Image(
                  image: const AssetImage(
                    "assets/logo.png",
                  ),
                  height: height * (65 / height),
                  width: width * (65 / width),
                ),
              ),
            ),
            const TabItem(
              icon: Icons.favorite_border_outlined,
            ),
            const TabItem(
              icon: Icons.search,
            ),
          ],
          style: TabStyle.fixedCircle,
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 2'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 3'),
    );
  }
}
