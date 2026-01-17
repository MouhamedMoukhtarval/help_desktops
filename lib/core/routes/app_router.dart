
import 'package:flutter/material.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/features/technician/ui/technician_home_screen.dart';

class AppRouter {
 Route? getRoute(RouteSettings settings){
  switch (settings.name) {
    case Routes.homeScreenTechnician:
      return MaterialPageRoute(
        builder: (context) => const TechnicianHomeScreen()
      );
    default:
      return null;
  }
 }
}