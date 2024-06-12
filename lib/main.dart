import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/routes/routes.dart';
import 'package:riverpod_udemy1/features/common/utils/appstyles.dart';
import 'package:riverpod_udemy1/features/global%20.dart';

void main() async {
  await Global.init();

  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
              navigatorKey: navkey,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Apptheme.appThemeData,
              onGenerateRoute: AppPages.generateroutesettings,
            ));
  }
}
