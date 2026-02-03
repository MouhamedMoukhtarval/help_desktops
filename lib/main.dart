import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/models/Ticket.dart';
import 'features/admin/admin_dashboard_screen.dart';
import 'features/admin/assign_technician_screen.dart';

void main() async {
  // Required for ScreenUtil to work correctly
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) =>
      const MaterialApp(
        title: 'Help Desktop',
        debugShowCheckedModeBanner: false,
        // Using const here is better for performance
        home: AdminDashboardScreen(),
      ),
    );
  }
}