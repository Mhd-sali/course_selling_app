import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';
import 'package:riverpod_udemy1/features/widgets/appimage.dart';
import 'package:riverpod_udemy1/features/widgets/apptextfield.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appshadowbox(
            color: AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: appimage(imagepath: ImageRes.searchIcon),
            ),
            appTextfieldOnly(
                width: 240, height: 40, hinteTxt: "Search your course")
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration:
              appshadowbox(border: Border.all(color: AppColors.primaryElement)),
          child: appimage(imagepath: ImageRes.searchButton),
        ),
      )
    ],
  );
}
