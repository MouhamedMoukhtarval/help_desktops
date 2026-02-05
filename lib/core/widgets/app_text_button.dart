import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final bool? isLoading;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColorsManager.mainBlue,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 16.w,
            vertical: verticalPadding?.h ?? 12.h,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(buttonWidth?.w ?? double.maxFinite, buttonHeight?.h ?? 52.h),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          ),
        ),
      ),
      onPressed: isLoading! ? null : onPressed,
      child: isLoading! ? const CircularProgressIndicator(color: Color.fromARGB(235, 255, 255, 255)) : Text(buttonText, style: textStyle),
    );
  }
}
