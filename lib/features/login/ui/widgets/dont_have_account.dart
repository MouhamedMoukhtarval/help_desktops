import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: AppTextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: "Sign Up",
            style: AppTextStyles.font13BlueRegular,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
