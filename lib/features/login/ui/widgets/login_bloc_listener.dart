import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/features/login/logic/cubit/login_cubit.dart';
import 'package:help_desktops/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccess ||
          current is LoginError ||
          current is LoginLoading,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColorsManager.mainBlue,
                ),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            switch(loginResponse.user!.role){
              case 'technicien':
                context.pushNamed(Routes.homeScreenTechnician);
              case 'admin':
                context.pushNamed(Routes.admin);
              default:
                context.pushNamed(Routes.employeeScreen);
                 
            }
          },
          loginError: (errorMessage) {
            setupErrorState(context, errorMessage);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String apiErrorModel) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: AppColorsManager.red, size: 32),
        content: Text(apiErrorModel, style: AppTextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('OK', style: AppTextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
