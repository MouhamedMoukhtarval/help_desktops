import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_button.dart';
import 'package:help_desktops/features/login/logic/cubit/login_cubit.dart';
import 'package:help_desktops/features/login/ui/widgets/dont_have_account.dart';
import 'package:help_desktops/features/login/ui/widgets/email_and_password.dart';
import 'package:help_desktops/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:help_desktops/features/login/ui/widgets/terms_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back", style: AppTextStyles.font24BlueBold),
                spacingVertical(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: AppTextStyles.font14LighterGrayRegular,
                ),
                spacingVertical(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    spacingVertical(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.font13BlueRegular,
                      ),
                    ),
                    spacingVertical(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: AppTextStyles.font16WhiteMedium,
                      onPressed: () {
                        validateAndLogin(context);
                      },
                    ),
                    spacingVertical(20),
                    const TermsConditionsText(),
                    spacingVertical(40),
                    const DontHaveAccount(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoadingStates();
    }
  }
}
