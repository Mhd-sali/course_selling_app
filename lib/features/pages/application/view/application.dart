import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/pages/application/controller/application_nav_notifier.dart';
import 'package:riverpod_udemy1/features/pages/application/widgets/bottomnav.dart';
import 'package:riverpod_udemy1/features/widgets/app_shadows.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: appScreens(index: index),
        bottomNavigationBar: Container(
          width: 375.w,
          height: 58.h,
          decoration: appshadowboxWithRadius(),
          child: BottomNavigationBar(
            items: bottomtab,
            onTap: (value) {
              ref.read(applicationNavIndexProvider.notifier).changeindex(value);
            },
            currentIndex: index,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryElementText,
          ),
        ),
      )),
    );
  }
}
