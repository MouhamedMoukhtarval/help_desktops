import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/routes/app_router.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';

class HelpDesktopApp extends StatelessWidget {
  final AppRouter appRouter;
  const HelpDesktopApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.getRoute,
        initialRoute: Routes.admin,
        title: 'Help Desktops',
        theme: ThemeData(
          primaryColor: AppColorsManager.white,
          scaffoldBackgroundColor: AppColorsManager.white,
        )
      )
    );
  }
}