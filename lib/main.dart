import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/helpers/constants_keys.dart';
import 'package:help_desktops/core/helpers/flutter_shared_preference_helper.dart';
import 'package:help_desktops/core/routes/app_router.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/help_desktop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final String? token = await FlutterSharedPreferenceHelper.getSecureToken(
    SharedPreferenceKeys.userToken,
  );
  final String? role = await FlutterSharedPreferenceHelper.getSecureToken(
    SharedPreferenceKeys.userRole,
  );
  String getInitialeRoute(String? role) {
    switch (role) {
      case 'admin':
        return Routes.admin;
      case 'technicien':
        return Routes.homeScreenTechnician;
      case 'employe':
        return Routes.employeeScreen;
      default:
        return Routes.loginScreen;
    }
  }

  String initialRoute;
  if (token != null && token.isNotEmpty) {
    initialRoute = getInitialeRoute(role);
  } else {
    initialRoute = Routes.loginScreen;
  }

  await setupGetIt();
  runApp(HelpDesktopApp(appRouter: AppRouter(), initialRoute: initialRoute));
}
