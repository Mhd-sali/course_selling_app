import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';

BoxDecoration appshadowbox({
  Color color = AppColors.primaryElement,
  double radius = 15.5,
  double sR = 1,
  double bR = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
      border: border,
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: sR,
            blurRadius: bR,
            offset: Offset(0, 1))
      ]);
}

BoxDecoration appshadowboxWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15.5,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      border: border,
      color: color,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: sR,
            blurRadius: bR,
            offset: const Offset(0, 1))
      ]);
}

BoxDecoration appBoxshadowTextfield(
    {Color color = AppColors.primaryBackground,
    Color bordercolor = AppColors.primaryFourElementText,
    double radius = 15.5,
    double sR = 1,
    double bR = 2}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: bordercolor));
}

class AppBarDecoration extends StatelessWidget {
  final double height;
  final double width;
  final String imagepath;
  const AppBarDecoration(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagepath = ImageRes.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: const DecorationImage(image: AssetImage(ImageRes.profile))),
    );
  }
}
