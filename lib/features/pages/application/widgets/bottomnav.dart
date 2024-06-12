import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/pages/home/view/home.dart';
import 'package:riverpod_udemy1/features/widgets/appimage.dart';

var bottomtab = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackground,
    label: 'Home',
    icon: _bottomcontainer(imagepath: ImageRes.home),
    activeIcon: _bottomcontainer(
        color: AppColors.primaryElement, imagepath: ImageRes.home),
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackground,
    label: 'Search',
    icon: _bottomcontainer(imagepath: ImageRes.search),
    activeIcon: _bottomcontainer(
        color: AppColors.primaryElement, imagepath: ImageRes.search),
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackground,
    label: 'Play',
    icon: _bottomcontainer(imagepath: ImageRes.play),
    activeIcon: _bottomcontainer(
        color: AppColors.primaryElement, imagepath: ImageRes.play),
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackground,
    label: 'message',
    icon: _bottomcontainer(imagepath: ImageRes.message),
    activeIcon: _bottomcontainer(
        color: AppColors.primaryElement, imagepath: ImageRes.message),
  ),
  BottomNavigationBarItem(
    backgroundColor: AppColors.primaryBackground,
    label: 'Profile',
    icon: _bottomcontainer(imagepath: ImageRes.profile),
    activeIcon: _bottomcontainer(
        color: AppColors.primaryElement, imagepath: ImageRes.profile),
  ),
];

//_bottomcontainer

Widget _bottomcontainer(
    {double width = 15,
    Color color = AppColors.primaryFourElementText,
    double height = 15,
    String imagepath = ImageRes.defaultImage}) {
  return Container(
    width: width,
    height: height,
    child: appimageWithcolor(imagepath: imagepath, color: color),
  );
}

///Appscreens

Widget appScreens({int index = 0}) {
  List<Widget> screens = [
    const HomeScreen(),
    Center(
      child: appimage(imagepath: ImageRes.search, width: 255, height: 255),
    ),
    Center(
      child: appimage(imagepath: ImageRes.play, width: 255, height: 255),
    ),
    Center(
        child: appimage(imagepath: ImageRes.message, width: 255, height: 255)),
    Center(
      child: appimage(imagepath: ImageRes.profile, width: 255, height: 255),
    )
  ];

  return screens[index];
}
