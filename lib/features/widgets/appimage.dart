import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';

Widget appimage(
    {String imagepath = ImageRes.user, double width = 16, double height = 16}) {
  return Image.asset(
    imagepath.isEmpty ? ImageRes.user : imagepath,
    width: width,
    height: height,
  );
}

Widget appimageWithcolor(
    {String imagepath = ImageRes.defaultImage,
    Color color = AppColors.primaryElement,
    double width = 16,
    double height = 16}) {
  return Image.asset(
    imagepath,
    width: width,
    height: height,
    color: color,
  );
}
