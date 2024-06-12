import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

Widget appButton(
    {String buttonName = "",
    double height = 50,
    double width = 325,
    bool isLogin = true,
    BuildContext? context,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width,
      height: height,
      decoration: appshadowbox(
          border: Border.all(color: AppColors.primaryFourElementText),
          color: isLogin ? AppColors.primaryElement : Colors.white),
      child: Center(
          child: Text16Normal(
              text: buttonName,
              color: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText)),
    ),
  );
}
