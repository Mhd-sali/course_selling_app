import 'package:flutter/material.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

AppBar buildAppBar({String title = ""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(10),
      child: Container(
        color: Colors.grey.withOpacity(0.3),
        height: 1,
      ),
    ),
    centerTitle: true,
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}
