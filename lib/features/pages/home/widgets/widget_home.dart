import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/global%20.dart';
import 'package:riverpod_udemy1/features/pages/home/controller/home_controller.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';
import 'package:riverpod_udemy1/features/widgets/appimage.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24normal(
          text: "ola",
          color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24normal(
          text: Global.storageService.getUserProfile().name!,
          fontWeight: FontWeight.bold),
    );
  }
}

class BannerHome extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const BannerHome({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 317.w,
          height: 165.h,
          child: PageView(
            controller: controller,
            onPageChanged: (value) {
              ref
                  .read(homescreenBannerDotsProvider.notifier)
                  .setindex(index: value);
            },
            children: [
              bannerContainer(),
              bannerContainer(imagepath: ImageRes.banner2),
              bannerContainer(imagepath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        DotsIndicator(
          position: ref.watch(homescreenBannerDotsProvider),
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(24.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        )
      ],
    );
  }
}

Container bannerContainer({String imagepath = ImageRes.banner1}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.fill)),
  );
}

AppBar homeAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appimage(imagepath: ImageRes.menu, width: 18.w, height: 12.h),
          const AppBarDecoration()
        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const Text16Normal(
                  fontWeight: FontWeight.bold,
                  text: "Choice your course",
                  color: AppColors.primaryText,
                ),
              ),
              GestureDetector(
                child: const Text14Normal(
                  color: AppColors.primaryThreeElementText,
                  text: "see all",
                ),
              )
            ],
          ),
        ),
        //course item button
        SizedBox(
          height: 20.h,
        ),
        Container(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
                decoration:
                    appshadowbox(color: AppColors.primaryElement, radius: 7.w),
                child: const Text11Normal(
                  text: "All",
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                    color: AppColors.primaryThreeElementText, text: "Popular"),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                child: const Text11Normal(
                    color: AppColors.primaryThreeElementText, text: "Newest"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CourseitemGrid extends StatelessWidget {
  const CourseitemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 40, crossAxisSpacing: 40),
          itemBuilder: (_, int index) => appimage()),
    );
  }
}
