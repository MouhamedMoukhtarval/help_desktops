import 'package:flutter/material.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class TermsConditionsText extends StatelessWidget {
  const TermsConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By continuing, you agree to our ",
            style: AppTextStyles.font14LighterGrayRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: AppTextStyles.font16DarkBlueMedium,
          ),
          TextSpan(
            text: "and ",
            style: AppTextStyles.font14LighterGrayRegular.copyWith(height: 1.5),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: AppTextStyles.font16DarkBlueMedium,
          ),
        ],
      ),
    );
  }
}
