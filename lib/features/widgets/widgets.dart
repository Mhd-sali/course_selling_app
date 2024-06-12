import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/utils/constants.dart';
import 'package:riverpod_udemy1/features/global%20.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

Widget _nextbutton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn);
      } else {
        Global.storageService
            .setbool(AppConstants.storageDeviceOpenFirstKey, true);
        Navigator.pushNamed(context, "/signin");
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appshadowbox(),
      child: Center(
          child: Text16Normal(
              text: index < 3 ? "Next" : "Get Started", color: Colors.white)),
    ),
  );
}

class AppOnBoardingPage extends StatelessWidget {
  final PageController controller;
  final String imagepath;
  final String title;
  final String subtitle;
  final int index;
  final BuildContext context;
  const AppOnBoardingPage(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.subtitle,
      required this.index,
      required this.context,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagepath,
          fit: BoxFit.fitWidth,
        ),
        Container(
            margin: const EdgeInsets.only(top: 15),
            child: text24normal(text: title)),
        Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text16Normal(text: subtitle),
        ),
        _nextbutton(index, controller, context),
      ],
    );
  }
}
