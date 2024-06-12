import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/pages/welcome/controller/welcome_notifier.dart';
import 'package:riverpod_udemy1/features/widgets/widgets.dart';

// ignore: must_be_immutable
class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _controller = PageController();
  int dotindex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexdotProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  dotindex = value;
                  ref.read(indexdotProvider.notifier).changeeindex(value);
                },
                controller: _controller,
                children: [
                  AppOnBoardingPage(
                      controller: _controller,
                      imagepath: ImageRes.reading,
                      title: "first see learning",
                      subtitle:
                          "Forget about the paper,now learning all in one place",
                      index: 1,
                      context: context),
                  AppOnBoardingPage(
                      controller: _controller,
                      imagepath: ImageRes.man,
                      title: "Connect with everyone",
                      subtitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      index: 2,
                      context: context),
                  AppOnBoardingPage(
                      controller: _controller,
                      imagepath: ImageRes.boy,
                      title: "Always Fascinated Learning",
                      subtitle:
                          "Anywhere ,anytime.The time is at your discretion. so study wherever",
                      index: 3,
                      context: context),
                ],
              ),
              Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
