import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/features/technician/logic/tech_home_cubit.dart';
import 'package:help_desktops/features/technician/ui/technician_home_screen.dart';

class AppRouter {
  Route? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreenTechnician:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<TechnicianHomeCubit>(),
            child: const TechnicianHomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
