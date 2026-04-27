import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_desktops/core/helpers/constants_keys.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/helpers/flutter_shared_preference_helper.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_cubit.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SginupError,
      listener: (context, state) {
        state.whenOrNull(
          sginupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColorsManager.mainBlue,
                ),
              ),
            );
          },
          sginupSuccess: (signupResponse) {
            showSuccessDialog(context);
          },
          sginupError: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withValues(alpha: .38),
              ),
              onPressed: () async {
                String? role = await FlutterSharedPreferenceHelper.getUserRole(
                  SharedPreferenceKeys.userRole,
                );
                if (!context.mounted) return;
                switch (role) {
                  case 'admin':
                    context.pushNamedAndRemoveUntil(
                      Routes.admin,
                      (route) => false,
                    );
                    break;
                  case 'technicien':
                    context.pushNamedAndRemoveUntil(
                      Routes.homeScreenTechnician,
                      (route) => false,
                    );
                    break;
                  default:
                    context.pushNamedAndRemoveUntil(
                      Routes.employeeScreen,
                      (route) => false,
                    );
                    break;
                }
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: AppTextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: AppTextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}
