import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/features/admin/data/models/ticket.dart';
import 'package:help_desktops/features/admin/ui/admin_dashboard_screen.dart';
import 'package:help_desktops/features/admin/ui/assign_technician_screen.dart';
import 'package:help_desktops/features/admin/ui/widget/add_edit_user_screen.dart';
import 'package:help_desktops/features/login/logic/cubit/login_cubit.dart';
import 'package:help_desktops/features/login/ui/login_screen.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_cubit.dart';
import 'package:help_desktops/features/sign_up/ui/sgin_up_screen.dart';
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
      case Routes.admin:
        return MaterialPageRoute(builder: (_) =>
         const AdminDashboardScreen());
      case Routes.assignTechnicianScreen:
        return MaterialPageRoute(
          builder: (context) =>
              AssignTechnicianScreen(ticket: settings.arguments as Ticket),
        );
      case Routes.userEditScreen:
        return MaterialPageRoute(builder: (context) => const AddEditUserScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getit<LoginCubit>(),
            child: const LoginScreen(),
        ));
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (context) => getit<SignUpCubit>(),
          child: const SignupScreen(),
        ));
      default:
        return null;
    }
  }
}
