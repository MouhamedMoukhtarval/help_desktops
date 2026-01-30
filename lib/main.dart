import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/routes/app_router.dart';
import 'package:help_desktops/help_desktop_app.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp( HelpDesktopApp( appRouter: AppRouter() ) );
}
