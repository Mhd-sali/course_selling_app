import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';

class Apptheme {
  static ThemeData appThemeData = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: AppColors.primaryText)));
}
