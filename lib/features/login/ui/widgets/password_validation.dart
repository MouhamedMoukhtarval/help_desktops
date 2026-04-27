import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasMinLength;
  final bool hasSpecialChar;
  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasSpecialChar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidation('At least one lowercase letter', hasLowercase),
        spacingVertical(2),
        buildValidation('At least one uppercase letter', hasUppercase),
        spacingVertical(2),
        buildValidation('At least one number', hasNumber),
        spacingVertical(2),
        buildValidation('At least 8 characters', hasMinLength),
        spacingVertical(2),
        buildValidation('At least one special character', hasSpecialChar),
      ],
    );
  }

  Row buildValidation(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: AppColorsManager.grayShade700,
        ),
        spacingHorizontal(6),
        Text(
          text,
          style: AppTextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.lightGreen,
            decorationThickness: 2,
            color: hasValidated
                ? const Color.fromARGB(255, 164, 163, 163)
                : AppColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
