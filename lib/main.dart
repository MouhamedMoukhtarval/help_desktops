import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/routes/app_router.dart';
import 'package:help_desktops/help_desktop_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(HelpDesktopApp(appRouter: AppRouter()));
=======
import 'package:help_desktops/core/routes/app_router.dart';
import 'package:help_desktops/help_desktop_app.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp( HelpDesktopApp( appRouter: AppRouter() ) );
>>>>>>> 6f70889232fc4a3bd0ace7db60272dffdafe0d78
}
